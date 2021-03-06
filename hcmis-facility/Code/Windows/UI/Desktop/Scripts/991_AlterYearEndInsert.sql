ALTER PROCEDURE [dbo].[proc_YearEndInsert]
(
	@ID int = NULL output,
	@ItemID int = NULL,
	@StoreID int = NULL,
	@Year int = NULL,
	@BBalance bigint = NULL,
	@EBalance bigint = NULL,
	@PhysicalInventory bigint = NULL,
	@Remark varchar(50) = NULL,
	@Month int = NULL,
	@EndingPrice decimal(18,0) = NULL,
	@PhysicalInventoryPrice decimal(18,0) = NULL,
	@BBPrice decimal(18,0) = NULL,
	@BatchNo varchar(50) = NULL,
	@AutomaticallyEntered bit = NULL,
	@UnitID int =NULL,
	@QtyPerPack int =NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [YearEnd]
	(
		[ItemID],
		[StoreID],
		[Year],
		[BBalance],
		[EBalance],
		[PhysicalInventory],
		[Remark],
		[Month],
		[EndingPrice],
		[PhysicalInventoryPrice],
		[BBPrice],
		[BatchNo],
		[AutomaticallyEntered],
		[UnitID],
		[QtyPerPack]
	)
	VALUES
	(
		@ItemID,
		@StoreID,
		@Year,
		@BBalance,
		@EBalance,
		@PhysicalInventory,
		@Remark,
		@Month,
		@EndingPrice,
		@PhysicalInventoryPrice,
		@BBPrice,
		@BatchNo,
		@AutomaticallyEntered,
		@UnitID,
		@QtyPerPack
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END
