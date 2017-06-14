---
-- Name: TSK-100 - A2G - BAI
-- Author: FlightControl
-- Date Created: 28 May 2017
--
-- # Situation:
-- 
-- This mission demonstrates the Task_BAI.
-- 
-- # Test cases: 
-- 

HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

CommandCenter = COMMANDCENTER:New( HQ, "Bravo" )

Scoring = SCORING:New( "BAI Demo" )

Mission = MISSION
  :New( CommandCenter, "Overlord", "Primary", "Perform a Battlefield Air Interdiction in the area!", coalition.side.RED )
  :AddScoring( Scoring )

AttackGroups = SET_GROUP:New():FilterCoalitions( "red" ):FilterPrefixes( "Attack" ):FilterStart()

TargetSetUnit = SET_UNIT:New():FilterCoalitions("blue"):FilterPrefixes( "Target" ):FilterStart()

TaskBAI = TASK_A2G_BAI:New( Mission, AttackGroups,"BAI", TargetSetUnit )
