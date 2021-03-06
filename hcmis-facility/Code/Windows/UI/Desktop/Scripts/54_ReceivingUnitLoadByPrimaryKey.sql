ALTER PROCEDURE [dbo].[proc_ReceivingUnitsLoadByPrimaryKey]
(
	@ID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[Name],
		[Description],
		[Phone],
		[Woreda],
		[Route],
		[Min],
		[Max],
		[IsActive],
		[Region],
		[Zone],
		[FacilityType]
	FROM [ReceivingUnits]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END
