---
-- Name: AID-100 - AI_A2A - Normal CAP
-- Author: FlightControl
-- Date Created: 30 May 2017
--
-- # Situation:
-- The Su-27 airplane will patrol in PatrolZone.
-- It will not engage any enemy automatically.
-- 
-- # Test cases:
-- 
-- 1. Observe the Su-27 patrolling.
-- 

EWR = DETECTION_AREAS:New( SET_GROUP:New():FilterPrefixes("AWACS"):FilterStart(), 6000 )
EWR:SetFriendliesRange( 150000 )

A2ADispatcher = AI_A2A_DISPATCHER:New( EWR )

A2ADispatcher:SetSquadron( "Mineralnye", AIRBASE.Caucasus.Mineralnye_Vody, { "SQ CCCP GCI MIG-31 1" }, 20 )
A2ADispatcher:SetSquadron( "Mozdok", AIRBASE.Caucasus.Mozdok, { "SQ CCCP GCI MIG-31 1" }, 2, 20 )
A2ADispatcher:SetSquadron( "Sochi", AIRBASE.Caucasus.Sochi_Adler, { "SQ CCCP GCI MIG-31 1", "SQ CCCP GCI" }, 2, 20 )

A2ADispatcher:SetCAP( "Mineralnye", ZONE:New( "CAP Zone East" ), 500, 1000, 500, 600 )
A2ADispatcher:SetCAPInterval( "Mineralnye", 2, 60, 180, 0.5 )

A2ADispatcher:SetCAP( "CAP East", ZONE:New( "CAP Zone West" ), 500, 1000, 500, 600 )
A2ADispatcher:SetCAPInterval( "CAP East", 60, 180, 0.5 )

A2ADispatcher:SetINTERCEPT( "Mineralnye", 900, 1200 )
A2ADispatcher:SetINTERCEPT( "Mozdok", 900, 1200 )
A2ADispatcher:SetINTERCEPT( "Sochi", 900, 1200 )

