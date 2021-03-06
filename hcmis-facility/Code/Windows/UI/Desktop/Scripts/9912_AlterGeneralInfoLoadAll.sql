ALTER PROCEDURE [dbo].[proc_GeneralInfoLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[HospitalName],
		[Woreda],
		[Zone],
		[Region],
		[Telephone],
		[HospitalContact],
		[LeadTime],
		[Min],
		[Max],
		[SafteyStock],
		[AMCRange],
		[ReviewPeriod],
		[EOP],
		[Description],
		[IsEven],
		[Logo],
		[DUMin],
		[DUMax],
		[DUAMCRange],
		[LastBackUp],
		[FacilityID],
		[LastSync],
		[DSUpdateFrequency],
		[RRFStatusUpdateFrequency],
		[RRFStatusFirstUpdateAfter],
		[ScmsWSUserName],
		[ScmsWSPassword]
	FROM [GeneralInfo]

	SET @Err = @@Error

	RETURN @Err
END
