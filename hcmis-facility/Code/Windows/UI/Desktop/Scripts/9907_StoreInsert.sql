ALTER PROCEDURE [dbo].[proc_StoresInsert]
(
	@ID int = NULL output,
	@HospitalID int = NULL,
	@StoreName varchar(50) = NULL,
	@IsActive bit = NULL,
	@SupplierID int =Null,
	@ReceivingUnitID int = Null
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Stores]
	(
		[HospitalID],
		[StoreName],
		[IsActive],
		[SupplierID],
		[ReceivingUnitID]
	)
	VALUES
	(
		@HospitalID,
		@StoreName,
		@IsActive,
		@SupplierID,
		@ReceivingUnitID
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
