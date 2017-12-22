 ---
-- Name: TAD-107 - A2G DETECTION_AREAS - No BAI task to CAS
-- Author: FlightControl
-- Date Created: 20 Dec 2017
--
-- # Situation:
-- 
-- This mission demonstrates the dynamic task dispatching for Air to Ground operations.
-- This test is about checking that if a player in the air is approaching a BAI task zone, that the task is not converted to a CAS!
-- Jump into the helicopter. Fly to the blue targets. They won't fire at you.
-- The su-34 will detect the blue targets, but will report a BAI task, even if you in the helicopter are near to the targets.

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
