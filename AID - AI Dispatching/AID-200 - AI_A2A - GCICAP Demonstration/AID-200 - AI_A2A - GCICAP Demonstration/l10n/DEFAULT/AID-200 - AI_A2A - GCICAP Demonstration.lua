---
-- Name: AID-200 - AI_A2A - GCICAP Demonstration
-- Author: FlightControl
-- Date Created: 05 July 2017


-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_GCICAP:New( { "DF CCCP" }, { "SQ CCCP" }, { "CAP Zone" }, 2 )

-- Enable the tactical display panel.
A2ADispatcher:SetTacticalDisplay( true )

-- Initialize the dispatcher, setting up a border zone. This is a polygon, 
-- which takes the waypoints of a late activated group with the name CCCP Border as the boundaries of the border area.
-- Any enemy crossing this border will be engaged.
CCCPBorderZone = ZONE_POLYGON:New( "CCCP Border", GROUP:FindByName( "CCCP Border" ) )
A2ADispatcher:SetBorderZone( CCCPBorderZone )



A2ADispatcher:SetTacticalDisplay(false)

A2ADispatcher:SetDefaultTakeoffFromParkingCold()
A2ADispatcher:SetDefaultLandingAtEngineShutdown()
A2ADispatcher:SetDefaultFuelThreshold( 0.20 )
A2ADispatcher:SetIntercept( 100 )
A2ADispatcher:SetDisengageRadius( 100000 )
A2ADispatcher:SetEngageRadius( 50000 )
A2ADispatcher:SetGciRadius( 100000 )


-------------------------------









-- Blue attack simulation
local Frequency = 600

BlueSpawn1 = SPAWN
  :New( "RT NATO 1" )
  :InitLimit( 2, 10 )
  :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
  :InitRandomizeRoute( 0, 0, 30000 )
  --:InitDelayOn()
  :SpawnScheduled( Frequency, 0.4 )

BlueSpawn2 = SPAWN
  :New( "RT NATO 2" )
  :InitLimit( 2, 10 )
  :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
  :InitRandomizeRoute( 0, 0, 30000 )
  --:InitDelayOn()
  :SpawnScheduled( Frequency, 0.4 )

BlueSpawn3 = SPAWN
  :New( "RT NATO 3" )
  :InitLimit( 2, 10 )
  :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
  :InitRandomizeRoute( 0, 0, 30000 )
  --:InitDelayOn()
  :SpawnScheduled( Frequency, 0.4 )

BlueSpawn4 = SPAWN
  :New( "RT NATO 4" )
  :InitLimit( 2, 10 )
  :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
  :InitRandomizeRoute( 0, 0, 30000 )
  --:InitDelayOn()
  :SpawnScheduled( Frequency, 0.4 )

