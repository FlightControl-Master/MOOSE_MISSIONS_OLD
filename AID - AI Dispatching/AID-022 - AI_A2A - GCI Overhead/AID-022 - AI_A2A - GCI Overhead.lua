---
-- Name: AID-022 - AI_A2A - GCI Overhead
-- Author: FlightControl
-- Date Created: 05 Sep 2017


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


-- Setup the squadrons.

A2ADispatcher:SetSquadron( "May", AIRBASE.Caucasus.Maykop_Khanskaya, { "SQ CCCP SU-27" } )
A2ADispatcher:SetSquadronGci( "May", 900, 1200 )
A2ADispatcher:SetSquadronOverhead( "May", 0.25 )

A2ADispatcher:SetSquadron( "Kras", AIRBASE.Caucasus.Krasnodar_Center, { "SQ CCCP SU-27" } )
A2ADispatcher:SetSquadronGci( "Kras", 900, 1200 )
A2ADispatcher:SetSquadronOverhead( "Kras", 1.5 )

A2ADispatcher:SetDefaultTakeoffInAir()
A2ADispatcher:SetDefaultLandingNearAirbase()

-- Blue attack simulation

local Frequency = 30

BlueSpawn2 = SPAWN
  :New( "RT NATO" )
  :InitLimit( 1, 40 )
  :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
  :InitRandomizeRoute( 0, 0, 30000 )
  :InitDelayOn()
  :SpawnScheduled( Frequency, 0.5 )

