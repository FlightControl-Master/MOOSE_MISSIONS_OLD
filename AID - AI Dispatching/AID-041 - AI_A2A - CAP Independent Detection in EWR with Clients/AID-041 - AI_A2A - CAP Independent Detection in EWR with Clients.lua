---
-- Name: AID-041 - AI_A2A - CAP Independent Detection in EWR with Clients
-- Author: FlightControl
-- Date Created: 01 Sep 2017


-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "DF CCCP AWACS", "DF CCCP EWR" } )
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )
Detection:SetRefreshTimeInterval( 10 )

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

A2ADispatcher:SetTacticalDisplay( true )
A2ADispatcher:SetRefreshTimeInterval( 10 )


A2ADispatcher:SetEngageRadius( 90000 )
-- Setup the squadrons.

A2ADispatcher:SetSquadron( "Kras1", AIRBASE.Caucasus.Krasnodar_Pashkovsky, { "SQ CCCP SU-27" } )
CAPZoneWest = ZONE_POLYGON:New( "CAP Zone West", GROUP:FindByName( "CAP Zone West" ) )
A2ADispatcher:SetSquadronCap( "Kras1", CAPZoneWest, 4000, 8000, 600, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "Kras1", 2, 30, 120 )

A2ADispatcher:SetSquadron( "May", AIRBASE.Caucasus.Maykop_Khanskaya, { "SQ CCCP SU-27" }, 20 )
CAPZoneWest = ZONE_POLYGON:New( "CAP Zone West", GROUP:FindByName( "CAP Zone West" ) )
A2ADispatcher:SetSquadronCap( "May", CAPZoneWest, 4000, 8000, 600, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "May", 2, 30, 120 )

A2ADispatcher:SetDefaultTakeoffInAir()
A2ADispatcher:SetDefaultLandingNearAirbase()

-- Blue attack simulation

--local Frequency = 600
--
--BlueSpawn2 = SPAWN
--  :New( "RT NATO" )
--  :InitLimit( 2, 40 )
--  :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
--  :InitRandomizeRoute( 0, 0, 30000 )
--  :InitDelayOn()
--  :SpawnScheduled( Frequency, 0.5 )
