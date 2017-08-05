---
-- Name: AID-017 - AI_A2A - Spawn Altitude Test
-- Author: FlightControl
-- Date Created: 05 Aug 2017


-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "DF CCCP AWACS", "DF CCCP EWR" } )
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

A2ADispatcher:SetTacticalDisplay( true )

-- Set the default takeoff method in the air.
A2ADispatcher:SetDefaultTakeoffInAir()

-- Set the default takeoff altitude at 2000 meters.
A2ADispatcher:SetDefaultTakeoffInAirAltitude( 2000 ) -- Takeoff by default at 2000 meters.


-- Spawn for Sochi airbase.
A2ADispatcher:SetSquadron( "Sochi", AIRBASE.Caucasus.Sochi_Adler, { "SQ CCCP SU-34" }, 20 )
A2ADispatcher:SetSquadronCap( "Sochi", ZONE:New( "PatrolZone" ), 4000, 8000, 600, 800, 1000, 1300 )
A2ADispatcher:SetSquadronCapInterval("Sochi", 2, 30, 600, 1 ) 
A2ADispatcher:SetSquadronGci( "Sochi", 900, 1200 )


-- Spawn for Gelend airbase.
A2ADispatcher:SetSquadron( "Gelend", AIRBASE.Caucasus.Gelendzhik, { "SQ CCCP SU-30" }, 20 )
A2ADispatcher:SetSquadronCap( "Gelend", ZONE:New( "PatrolZoneGelend" ), 4000, 8000, 600, 800, 1000, 1300 )
A2ADispatcher:SetSquadronCapInterval( "Gelend", 2, 30, 600, 1 ) 
A2ADispatcher:SetSquadronGci( "Gelend", 900, 1200 )

-- Let Gelend squadron take off in the air at 4000 meters.
A2ADispatcher:SetSquadronTakeoffInAir( "Gelend", 4000 ) -- Takeoff in Gelend at 4000 meters.


-- Run the mission and observe the spawning altitudes.
