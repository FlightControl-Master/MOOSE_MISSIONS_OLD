 ---
-- Name: TAD-106 - A2G DETECTION_AREAS - Split SEAD to BAI and SEAD
-- Author: FlightControl
-- Date Created: 05 Dec 2017
--
-- # Situation:
-- 
-- This mission demonstrates the dynamic task dispatching for Air to Ground operations.
-- This test is about a SEAD task, dispatched, that is split into a SEAD and BAI task, when units are moving away from the zone.

local HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

local CommandCenter = COMMANDCENTER:New( HQ, "Lima" )

local Scoring = SCORING:New( "A2G Dispatching Demo" )

local Mission = MISSION
  :New( CommandCenter, "Overlord", "High", "Attack Detect Mission Briefing", coalition.side.RED )
  :AddScoring( Scoring )

local FACSet = SET_GROUP:New():FilterPrefixes( "FAC" ):FilterCoalitions("red"):FilterStart()

local FACAreas = DETECTION_AREAS:New( FACSet, 1000 )
--FACAreas:BoundDetectedZones()

local AttackGroups = SET_GROUP:New():FilterCoalitions( "red" ):FilterPrefixes( "Attack" ):FilterStart()

TaskDispatcher = TASK_A2G_DISPATCHER:New( Mission, AttackGroups, FACAreas )


MissileTrainer = MISSILETRAINER:New( 100, "Missiles will be destroyed for training when they reach your plane." )
