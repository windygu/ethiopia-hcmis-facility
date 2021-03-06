CREATE PROCEDURE [dbo].[proc_TransferInsert]
(
	@ID int = NULL output,
	@BatchNo varchar(50) = NULL,
	@ItemID int = NULL,
	@SupplierID int = NULL,
	@Quantity bigint = NULL,
	@Date datetime = NULL,
	@ExpDate datetime = NULL,
	@Out bit = NULL,
	@ReceivedStatus int = NULL,
	@ReceivedBy varchar(50) = NULL,
	@FromStoreID int =NULL,
	@ToStoreID int =NULL,
	@Remark text = NULL,
	@StoreID int = NULL,
	@LocalBatchNo varchar(50) = NULL,
	@RefNo varchar(50) = NULL,
	@Cost float = NULL,
	@IsApproved bit = NULL,
	@QuantityLeft bigint = NULL,
	@NoOfPack int = NULL,
	@QtyPerPack int = NULL,
	@EurDate datetime = NULL,
	@ManufacturerID int = NULL,
	@BoxLevel int = NULL,
	@SubProgramID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Transfer]
	(
		[BatchNo],
		[ItemID],
		[SupplierID],
		[Quantity],
		[Date],
		[ExpDate],
		[Out],
		[ReceivedStatus],
		[ReceivedBy],
		[Remark],
		[FromStoreID],
		[ToStoreID],
		[LocalBatchNo],
		[RefNo],
		[Cost],
		[IsApproved],
		[QuantityLeft],
		[NoOfPack],
		[QtyPerPack],
		[EurDate],
		[ManufacturerID],
		[BoxLevel],
		[SubProgramID]
	)
	VALUES
	(
		@BatchNo,
		@ItemID,
		@SupplierID,
		@Quantity,
		@Date,
		@ExpDate,
		@Out,
		@ReceivedStatus,
		@ReceivedBy,
		@Remark,
		@FromStoreID,
		@ToStoreID,
		@LocalBatchNo,
		@RefNo,
		@Cost,
		@IsApproved,
		@QuantityLeft,
		@NoOfPack,
		@QtyPerPack,
		@EurDate,
		@ManufacturerID,
		@BoxLevel,
		@SubProgramID
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END

SET ANSI_NULLS ON