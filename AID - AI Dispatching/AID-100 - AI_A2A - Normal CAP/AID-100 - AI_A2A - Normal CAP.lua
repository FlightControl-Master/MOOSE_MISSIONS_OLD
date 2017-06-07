---
-- Name: AID-100 - AI_A2A - Normal CAP
-- Author: FlightControl
-- Date Created: 30 May 2017


-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New():FilterPrefixes( { "DF CCCP AWACS", "DF CCCP EWR" } ):FilterStart()

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( DetectionSetGroup, 6000 )


-- Initialize the dispatcher, setting up a border zone. This is a polygon, which takes the waypoints of a late activated group with the name CCCP Border as the boundaries of the border area.
-- Any enemy crossing this border will be engaged.
--A2ADispatcher:InitBorderZone( { ZONE_POLYGON:New( "CCCP Border", GROUP:FindByName( "CCCP Border" ) ) } )

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher:InitEngageRadius( 100000 )


-- Setup the squadrons.

A2ADispatcher:SetSquadron( "Mineralnye", AIRBASE.Caucasus.Mineralnye_Vody, { "SQ CCCP SU-27" }, 20 )
A2ADispatcher:SetSquadronOverhead( "Mineralnye", 1 )
A2ADispatcher:SetSquadronGrouping( "Mineralnye", 2 )

A2ADispatcher:SetSquadron( "Maykop", AIRBASE.Caucasus.Maykop_Khanskaya, { "SQ CCCP MIG-31" }, 20 )
A2ADispatcher:SetSquadronOverhead( "Maykop", 1 )

A2ADispatcher:SetSquadron( "Mozdok", AIRBASE.Caucasus.Mozdok, { "SQ CCCP MIG-31" }, 20 )
A2ADispatcher:SetSquadronOverhead( "Mozdok", 1 )
  
A2ADispatcher:SetSquadron( "Sochi", AIRBASE.Caucasus.Sochi_Adler, { "SQ CCCP SU-27" }, 20 )
A2ADispatcher:SetSquadronOverhead( "Sochi", 1 )
A2ADispatcher:SetSquadronGrouping( "Sochi", 2 )

A2ADispatcher:SetSquadron( "Novo", AIRBASE.Caucasus.Novorossiysk, { "SQ CCCP SU-27" }, 20 )
A2ADispatcher:SetSquadronOverhead( "Novo", 1 )
A2ADispatcher:SetSquadronGrouping( "Novo", 3 )

-- Squadron Mineralnye will execute CAP.

A2ADispatcher:SetSquadronCap( "Mineralnye", ZONE_POLYGON:New( "CAP Zone East", GROUP:FindByName( "CAP Zone East" ) ), 4000, 10000, 500, 600 )
A2ADispatcher:SetSquadronCapInterval( "Mineralnye", 2, 30, 60, 1 )


A2ADispatcher:SetSquadronCap( "Sochi", ZONE_POLYGON:New( "CAP Zone West", GROUP:FindByName( "CAP Zone West" ) ), 4000, 8000, 600, 800, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "Sochi", 2, 30, 120, 1 )

-- Squadrons to execute GCI.

A2ADispatcher:SetSquadronGci( "Mozdok", 900, 1200 )
A2ADispatcher:SetSquadronGci( "Novo", 900, 2100 )
A2ADispatcher:SetSquadronGci( "Maykop", 900, 1200 )

-- Blue attack simulation

local Frequency = 600

BlueSpawn1 = SPAWN
  :New( "RT NATO 1" )
  :InitLimit( 2, 10 )
  :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
  :InitRandomizeRoute( 0, 0, 30000 )
  :SpawnScheduled( Frequency, 0.4 )

BlueSpawn2 = SPAWN
  :New( "RT NATO 2" )
  :InitLimit( 2, 10 )
  :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
  :InitRandomizeRoute( 0, 0, 30000 )
  :SpawnScheduled( Frequency, 0.4 )

BlueSpawn3 = SPAWN
  :New( "RT NATO 3" )
  :InitLimit( 2, 10 )
  :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
  :InitRandomizeRoute( 0, 0, 30000 )
  :SpawnScheduled( Frequency, 0.4 )

BlueSpawn4 = SPAWN
  :New( "RT NATO 4" )
  :InitLimit( 2, 10 )
  :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
  :InitRandomizeRoute( 0, 0, 30000 )
  :SpawnScheduled( Frequency, 0.4 )

