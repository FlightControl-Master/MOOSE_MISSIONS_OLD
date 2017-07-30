---
-- Name: AID-011 - AI_A2A - RTB Fuel Treshold test
-- Author: FlightControl
-- Date Created: 30 Jul 2017


-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "DF CCCP AWACS", "DF CCCP EWR" } )
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

-- Initialize the dispatcher, setting up a border zone. This is a polygon, 
-- which takes the waypoints of a late activated group with the name CCCP Border as the boundaries of the border area.
-- Any enemy crossing this border will be engaged.
CCCPBorderZone = ZONE_POLYGON:New( "CCCP Border", GROUP:FindByName( "CCCP Border" ) )
--A2ADispatcher:SetBorderZone( CCCPBorderZone )

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher:SetEngageRadius( 200000 )


A2ADispatcher:SetTacticalDisplay( true )

-- Set the fuel treshold to 40%. Airplanes will return when only 40% of fuel left in the tank.
A2ADispatcher:SetDefaultFuelTreshold( 0.4 )

-- Setup the squadrons.

A2ADispatcher:SetSquadron( "Sochi", AIRBASE.Caucasus.Sochi_Adler, { "SQ CCCP SU-27" }, 20 )
A2ADispatcher:SetSquadronOverhead( "Sochi", 1 )
A2ADispatcher:SetSquadronGrouping( "Sochi", 2 )

-- CAP Squadron execution.

CAPZoneWest = ZONE_POLYGON:New( "CAP Zone West", GROUP:FindByName( "CAP Zone West" ) )
A2ADispatcher:SetSquadronCap( "Sochi", CAPZoneWest, 4000, 8000, 600, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "Sochi", 2, 30, 120, 1 )

A2ADispatcher:SetSquadronGci( "Sochi", 900, 1200 )

A2ADispatcher:SetSquadronTakeoffFromParkingHot("Sochi")
A2ADispatcher:SetSquadronLandingAtEngineShutdown("Sochi")


