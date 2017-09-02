---
-- Name: AID-021 - AI_A2A - GCI Radius Test
-- Author: FlightControl
-- Date Created: 30 May 2017


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

A2ADispatcher:SetGciRadius( 100000 )

A2ADispatcher:SetTacticalDisplay( true )


-- Setup the squadrons.

A2ADispatcher:SetSquadron( "Kras1", AIRBASE.Caucasus.Krasnodar_Center, { "SQ CCCP SU-27" } )
A2ADispatcher:SetSquadronGci( "Kras1", 900, 1200 )

A2ADispatcher:SetSquadron( "Kras2", AIRBASE.Caucasus.Krasnodar_Pashkovsky, { "SQ CCCP SU-27" } )
A2ADispatcher:SetSquadronGci( "Kras2", 900, 1200 )

A2ADispatcher:SetSquadron( "May", AIRBASE.Caucasus.Maykop_Khanskaya, { "SQ CCCP SU-27" } )
A2ADispatcher:SetSquadronGci( "May", 900, 1200 )



A2ADispatcher:SetDefaultTakeoffInAir()
A2ADispatcher:SetDefaultLandingNearAirbase()

