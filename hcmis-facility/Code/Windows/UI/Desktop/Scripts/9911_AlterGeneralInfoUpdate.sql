ALTER PROCEDURE [dbo].[proc_GeneralInfoUpdate]
(
	@ID int,
	@HospitalName varchar(50) = NULL,
	@Woreda int = NULL,
	@Zone int = NULL,
	@Region int = NULL,
	@Telephone varchar(50) = NULL,
	@HospitalContact varchar(50) = NULL,
	@LeadTime int = NULL,
	@Min int = NULL,
	@Max int = NULL,
	@SafteyStock int = NULL,
	@AMCRange int = NULL,
	@ReviewPeriod int = NULL,
	@EOP float = NULL,
	@Description text = NULL,
	@IsEven bit = NULL,
	@Logo varchar(50) = NULL,
	@DUMin float = NULL,
	@DUMax float = NULL,
	@DUAMCRange int = NULL,
	@LastBackUp datetime = NULL,
	@FacilityID int = NULL,
	@LastSync datetime = NULL,
	@DSUpdateFrequency varchar(50) = NULL,
	@RRFStatusUpdateFrequency varchar(50) = NULL,
	@RRFStatusFirstUpdateAfter varchar(50) = NULL,
	@ScmsWSUserName nvarchar(100) = NULL,
	@ScmsWSPassword nvarchar(100) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [GeneralInfo]
	SET
		[HospitalName] = @HospitalName,
		[Woreda] = @Woreda,
		[Zone] = @Zone,
		[Region] = @Region,
		[Telephone] = @Telephone,
		[HospitalContact] = @HospitalContact,
		[LeadTime] = @LeadTime,
		[Min] = @Min,
		[Max] = @Max,
		[SafteyStock] = @SafteyStock,
		[AMCRange] = @AMCRange,
		[ReviewPeriod] = @ReviewPeriod,
		[EOP] = @EOP,
		[Description] = @Description,
		[IsEven] = @IsEven,
		[Logo] = @Logo,
		[DUMin] = @DUMin,
		[DUMax] = @DUMax,
		[DUAMCRange] = @DUAMCRange,
		[LastBackUp] = @LastBackUp,
		[FacilityID] = @FacilityID,
		[LastSync] = @LastSync,
		[DSUpdateFrequency] = @DSUpdateFrequency,
		[RRFStatusUpdateFrequency] = @RRFStatusUpdateFrequency,
		[RRFStatusFirstUpdateAfter] = @RRFStatusFirstUpdateAfter,
		[ScmsWSUserName] = @ScmsWSUserName,
		[scmsWSPassword] = @ScmsWSPassword
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END
