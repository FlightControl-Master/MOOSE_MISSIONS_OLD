

-- RED

--- Setup the Red Coalition A2A GCICAP dispatcher, and initialize it.
-- EWR network groups start with RED EWR, which are ships and patrols.
-- Squadron templates which are placed above the colored airbases, start with TR SQ.
-- Perform CAP, the zone for CAP starts with TR CAP, send minimal 10 groups of planes in the air.
A2A_GCICAP_Red = AI_A2A_GCICAP:New( { "TR SQ"}, { "TR SQ" }, { "TR CAP" }, 10 )

A2A_GCICAP_Red:SetBorderZone( ZONE_POLYGON:New( "Red Border", GROUP:FindByName( "Red Border" ) ) )

-- Enable the tactical display panel. This is to see what this dispatcher is doing.
--A2A_GCICAP_Red:SetTacticalDisplay( true )

-- BLUE

--- Setup the Red Coalition A2A GCICAP dispatcher, and initialize it.
-- EWR network groups start with BLUE EWR.
-- Squadron templates which are placed above the colored airbases, start with UK SQ.
-- Perform no CAP.
A2A_GCICAP_Blue = AI_A2A_GCICAP:New( { "BLUE EWR" }, { "UK SQ" }, { }, 2 )

A2A_GCICAP_Blue:SetBorderZone( ZONE_POLYGON:New( "Blue Border", GROUP:FindByName( "Blue Border" ) ) )



