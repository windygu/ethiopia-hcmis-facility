ALTER PROCEDURE [dbo].[proc_DisposalLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[ItemID],
		[StoreId],
		[ReasonId],
		[Quantity],
		[Date],
		[ApprovedBy],
		[Losses],
		[BatchNo],
		[Remark],
		[Cost],
		[RefNo],
		[EurDate],
		[RecID],
		[UnitID]
	FROM [Disposal]

	SET @Err = @@Error

	RETURN @Err
END
