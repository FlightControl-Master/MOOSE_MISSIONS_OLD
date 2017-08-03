---
-- Name: AID-016 - AI_A2A - Refuel Tanker Test
-- Author: FlightControl
-- Date Created: 01 Aug 2017


-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "DF CCCP AWACS", "DF CCCP EWR" } )
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )


-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher:SetEngageRadius( 200000 )


A2ADispatcher:SetTacticalDisplay( true )

-- Test intercept.
A2ADispatcher:SetIntercept( 450 )


-- Setup the squadrons.

A2ADispatcher:SetSquadron( "Sochi", AIRBASE.Caucasus.Sochi_Adler, { "SQ CCCP SU-34" }, 20 )
A2ADispatcher:SetSquadronCap( "Sochi", ZONE:New( "PatrolZone" ), 4000, 8000, 600, 800, 1000, 1300 )
A2ADispatcher:SetSquadronCapInterval("Sochi", 2, 30, 600, 1 ) 
A2ADispatcher:SetSquadronGci( "Sochi", 900, 1200 )


A2ADispatcher:SetDefaultFuelThreshold( 0.9 )
A2ADispatcher:SetDefaultTanker( "Tanker" )


A2ADispatcher:SetSquadron( "Gelend", AIRBASE.Caucasus.Gelendzhik, { "SQ CCCP SU-30" }, 20 )
A2ADispatcher:SetSquadronCap( "Gelend", ZONE:New( "PatrolZoneGelend" ), 4000, 8000, 600, 800, 1000, 1300 )
A2ADispatcher:SetSquadronCapInterval( "Gelend", 2, 30, 600, 1 ) 
A2ADispatcher:SetSquadronGci( "Gelend", 900, 1200 )

A2ADispatcher:SetSquadronFuelThreshold( "Gelend", 0.8 )
A2ADispatcher:SetSquadronTanker( "Gelend", "TankerGelend" )


