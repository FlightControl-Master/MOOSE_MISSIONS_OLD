

-- RED

--- Setup the Red Coalition A2A GCICAP dispatcher, and initialize it.
A2A_GCICAP_Red = AI_A2A_GCICAP:New( { "RED EWR" }, { "4477th" }, { }, 2 )

A2A_GCICAP_Red:SetBorderZone( ZONE_POLYGON:New( "Red Border", GROUP:FindByName( "Red Border" ) ) )

-- Enable the tactical display panel. This is to see what this dispatcher is doing.
--A2A_GCICAP_Red:SetTacticalDisplay( true )

 
-- Initialize the dispatcher, setting up a radius of 150km where any airborne friendly 
-- without an assignment within 150km radius from a detected target, will engage that target.
A2A_GCICAP_Red:SetEngageRadius( 150000 )

-- The default take-off method is planes takeoff right in the air.
-- Here we specify to take off from a parking space, with engines already running.
A2A_GCICAP_Red:SetSquadronTakeoffFromParkingHot( AIRBASE.Nevada.Tonopah_Test_Range_Airfield )
--A2A_GCICAP_Red:SetSquadronTakeoffFromParkingHot( "Groom Lake AFB" )


-- BLUE


--- Setup the Red Coalition A2A GCICAP dispatcher, and initialize it.
-- EWR network groups start with BLUE EWR.
-- Squadron templates which are placed above the colored airbase, start with 104th or 105th or 106th.
-- Perform CAP in a polygon zone placed near 104th, which is Nellis.
-- Perform 2 CAP.
A2A_GCICAP_Blue = AI_A2A_GCICAP:New( { "BLUE EWR" }, { "104th", "105th", "106th" }, { "104th CAP" }, 2 )

A2A_GCICAP_Blue:SetBorderZone( ZONE_POLYGON:New( "Blue Border", GROUP:FindByName( "Blue Border" ) ) )

-- Enable the tactical display panel. This is to see what this dispatcher is doing.
--A2A_GCICAP_Blue:SetTacticalDisplay( true )

 
-- Initialize the dispatcher, setting up a radius of 150km where any airborne friendly 
-- without an assignment within 150km radius from a detected target, will engage that target.
A2A_GCICAP_Blue:SetEngageRadius( 150000 )

-- The default take-off method is planes takeoff right in the air.
-- Here we specify other take off options.
A2A_GCICAP_Blue:SetSquadronTakeoffFromRunway( AIRBASE.Nevada.Boulder_City_Airport ) -- Takeoff from the runway.
A2A_GCICAP_Blue:SetSquadronTakeoffFromParkingCold( AIRBASE.Nevada.McCarran_International_Airport ) -- Takeoff from parking spot, with engines shut off.
--A2A_GCICAP_Blue:SetSquadronTakeoffFromParkingHot( AIRBASE.Nevada.Nellis_AFB ) -- Takaeoff from parking spot, engines running.

-- The Nellis airbase contains a squadron that flies an F-5... Less modern airplane.
-- So it needs a stronger "overhead".
A2A_GCICAP_Blue:SetSquadronOverhead( AIRBASE.Nevada.Nellis_AFB, 2 ) -- When 2 airplanes are attacking, we spawn 4 airplanes for defense.
A2A_GCICAP_Blue:SetSquadronGrouping( AIRBASE.Nevada.Nellis_AFB, 2 ) -- We group the spawned defence airplanes per 2 units.

