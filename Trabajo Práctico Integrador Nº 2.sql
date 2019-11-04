-- 1 - Elaborar una vista que permita conocer para cada cliente: el apellido y nombres,
-- los n�meros de cuenta, el saldo de la cuenta, la cantidad de movimientos realizados por cada 
-- cuenta y el saldo acumulado entre todas las cuentas de cada cliente.



		Create View VW_Cliente_Info as
		Select CLI.APELLIDO + ', ' + CLI.NOMBRE as 'Apellido y Nombre', 
		CU.IDCUENTA as 'Nro de cuenta'
		,CU.Saldo as 'Saldo de cuenta', CU.Tipo as 'Tipo', 
		(Select count(*) from MOVIMIENTOS as M where M.IDCUENTA = Cu.IDCUENTA ) as 'Movimientos',
		(Select sum (CUENTAS.SALDO) from CUENTAS where CUENTAS.IDCLIENTE = CU.IDCLIENTE)
		as 'Saldo Total'
		from CLIENTES as CLI inner join CUENTAS as CU 
		on CLI.IDCLIENTE = CU.IDCLIENTE 


--2 - Elaborar un procedimiento almacenado que permita crear una cuenta. El procedimiento debe
-- recibir: @IDCliente, @Tipo y @Limite. Debe permitir cumplir la siguiente condici�n:
--Los tipos de cuenta pueden ser: CA - Caja de ahorro y CC - Cuenta corriente. De lo contrario
--, impedir el ingreso.
--Si el tipo es Caja de Ahorro entonces el l�mite de la cuenta debe ser obligatoriamente cero.
--Si el tipo es Cuenta corriente entonces el l�mite puede ser cualquier n�mero mayor o igual que cero.
--Tener en cuenta que en el l�mite siempre se almacena con un valor negativo.
--El saldo siempre ser� cero y el estado siempre ser� uno.


--CONSULTAR SOBRE CC CA DE LIMITE  ERROR O PONER SIEMPRE EN 0

Create procedure SP_CrearCuenta @IDCliente bigint, @Tipo varchar(2), @Limite money as
begin
	Begin try
		if @Tipo in ('CC','Cc','cC','cc' )
			Begin
				SET @Limite = @Limite * -1
				insert into CUENTAS VALUES( @idCliente, @tipo, @limite,0,1)
			End
		Else
		if @Tipo in ('CA','Ca','cA','ca' )
			begin
				if @Limite >= 0
				begin
					insert into CUENTAS VALUES( @idCliente, @tipo,0,0,1)
				end
				else
				Begin
					RAISERROR ('El Limite tiene que ser mayor o igual a 0', 16, 1)
				End
			end
		else
			Begin
				RAISERROR ('NO SE PUEDE CARGAR DATOS SI NO ES CC O CA', 16, 1)
			END
	END TRY
	BEGIN CATCH
	 PRINT ERROR_MESSAGE()
	END CATCH
end

--EXEC SP_CrearCuenta 1, 'CA', 5000
--EXEC SP_CrearCuenta 5, 'CC', 5000

--select * from CUENTAS


--3 - Realizar un trigger que al registrar una nueva cuenta le sea otorgada una tarjeta de d�bito.
 --La misma se identifica con un valor 'D' en el Tipo de la tarjeta.

create trigger TR_AltaTarjetaDebito on Cuentas
after Insert
AS
BEGIN
	Declare @IdCliente bigint
	select @IdCliente = IdCliente from inserted
	insert into TARJETAS VALUES(@IdCliente,'D',1)
END



--4 - Realizar un trigger que al registrar un nuevo usuario le sea otorgada una Caja de Ahorro nueva.

create trigger TR_AltaCajaAhorro on Clientes
after insert
as
begin
	Declare  @IDCLIENTE bigint
	select @IDCLIENTE = IDCLIENTE from inserted
	insert into CUENTAS values (@IDCLIENTE,'CA',0,0,1) 
end

--insert into clientes values (5,'Valenzuela', 'Elias',1)
--select * from CUENTAS
--select * From tarjetas
--Select * from CLIENTES


--5 - Realizar un trigger que al eliminar un usuario realice la baja l�gica del mismo. 
--Si se elimina un usuario que ya se encuentra dado de baja l�gica y dicho usuario
-- no registra ni cuentas ni tarjetas, proceder a la baja f�sica del usuario.

create trigger TR_BajaLogicaUsuario  on Clientes
INSTEAD OF DELETE 
AS
BEGIN
BEGIN TRY 
BEGIN TRANSACTION
	DECLARE @IDCLIENTE bigint 
	Declare @Estado bit
	select @IDCLIENTE =IDCLIENTE from deleted
	select @Estado =Estado from deleted
	if @Estado = 0
		begin
			declare @ContCuentas int
			declare @ContTarjetas int
			declare @IDCUENTA bigint
			Select  @IDCUENTA = IDCUENTA from CUENTAS where IDCLIENTE = @IDCLIENTE
			Select  @ContCuentas = COUNT(*) from CUENTAS where CUENTAS.IDCLIENTE = @IDCLIENTE
			Select  @ContTarjetas = COUNT(*) from TARJETAS where TARJETAS.IDCUENTA= @IDCUENTA
			if @ContCuentas = 0 and @ContTarjetas = 0
				delete CLIENTES where CLIENTES.IDCLIENTE = @IDCLIENTE
			else
				RAISERROR ('El cliente tiene cuentas o tarjetas asociadas', 16, 1)
		end
	else
		begin
			UPDATE CLIENTES SET ESTADO=0 WHERE IDCLIENTE= @IDCLIENTE			
		end
COMMIT TRANSACTION
END TRY

BEGIN CATCH 
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
END CATCH

END

--delete CLIENTES where IDCLIENTE = 5
	

--6 - Realizar un trigger que al registrar un nuevo movimiento, actualice el saldo de la cuenta.
-- Deber� acreditar o debitar dinero en la cuenta dependiendo del tipo de movimiento
--  ('D' - D�bito y 'C' - Cr�dito). Se deber�:
--Registrar el movimiento
--Actualizar el saldo de la cuenta


CREATE TRIGGER TR_ActualizarSaldo on MOVIMIENTOS
AFTER INSERT 
AS
BEGIN 
BEGIN TRY 
BEGIN TRANSACTION 
	DECLARE @Tipo varchar
	DECLARE @Importe float
	DECLARE @IdCuenta bigint
	select @Tipo = TIPO, @Importe = IMPORTE, @IdCuenta = IDCUENTA from inserted 
	IF( @Tipo = 'C')
		BEGIN 
			UPDATE CUENTAS set SALDO = SALDO + @Importe where IDCUENTA = @IdCuenta
		END
	IF( @Tipo = 'D')
		BEGIN 
			UPDATE CUENTAS set SALDO = SALDO - @Importe where IDCUENTA = @IdCuenta
		END
COMMIT TRANSACTION 
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH

END





--7 - Realizar un trigger que al registrar una nueva transferencia, registre los movimientos
 --y actualice los saldos de las cuenta. Deber� verificar que las cuentas de origen
 -- y destino sean distintas. Se deber�:
--Registrar la transferencia
--Registrar el movimiento de la cuenta de origen
--Registrar el movimiento de la cuenta de destino

--NOTA: La acci�n deber�a generar una reacci�n en cadena si se realiz� correctamente el Trigger de (6).


Create procedure SP_Movimiento @IDCuenta bigint, @Tipo varchar(2), @Importe money as
begin
	Begin try
		insert into MOVIMIENTOS values (@IDCuenta,@Importe,@Tipo,getdate(),1)
	END TRY
	BEGIN CATCH	 
	END CATCH
end


CREATE TRIGGER TR_Transferencia on Transferencias
INSTEAD OF INSERT 
AS
BEGIN 
BEGIN TRY 
BEGIN TRANSACTION 
	
	DECLARE @Origen bigint
	DECLARE @Destino bigint
	DECLARE @Importe float
	Select @Origen = ORIGEN, @Destino = DESTINO , @Importe = IMPORTE from inserted
	if @Origen = @Destino
		begin
			RAISERROR ('La cuenta Origen no puede ser igual a la cuenta Destino',16,1)
		end
	else
	EXEC SP_Movimiento @Destino,'C', @Importe 
	EXEC SP_Movimiento @Origen, 'D', @Importe 

COMMIT TRANSACTION 
END TRY

BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
END CATCH

END