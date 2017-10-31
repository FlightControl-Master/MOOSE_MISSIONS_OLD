---
-- Name: AID-071 - AI_A2A - GCI - Player Exit
-- Author: FlightControl
-- Date Created: 30 Oct 2017
-- 
-- Test Scenario(s):
-- 
-- Now take a seat in the client plane as a player.
-- Do the following tests after the plane has been spawned.
-- 1. Immediately exit the plane.
-- 2. Only exit the plane once the defender is engaged.
-- 3. Let the defender shoot you.
-- In all these scenarios, observe if the defender is returning to base.


-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "DF CCCP AWACS", "DF CCCP EWR" } )
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

A2ADispatcher:SetTacticalDisplay( true )


-- Setup the squadrons.

A2ADispatcher:SetSquadron( "Kras1", AIRBASE.Caucasus.Krasnodar_Pashkovsky, { "SQ CCCP SU-27" }, 20 )
A2ADispatcher:SetSquadronGci( "Kras1", 800, 1200 )

A2ADispatcher:SetDefaultTakeoffInAir()
A2ADispatcher:SetDefaultLandingNearAirbase()

