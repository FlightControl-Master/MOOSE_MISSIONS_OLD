---
-- Name: TSK-010 - Task Modelling - SEAD.lua
-- Author: FlightControl
-- Date Created: 31 Mar 2017
--
-- # Situation:
-- 
-- This mission demonstrates the Task_SEAD.
-- 
-- # Test cases: 
-- 

HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

CommandCenter = COMMANDCENTER:New( HQ, "Lima" )

Scoring = SCORING:New( "Detect Demo" )

Mission = MISSION
  :New( CommandCenter, "Overlord", "High", "SEAD the area!", coalition.side.RED )
  :AddScoring( Scoring )

AttackGroups = SET_GROUP:New():FilterCoalitions( "red" ):FilterPrefixes( "Attack" ):FilterStart()

TargetSetUnit = SET_UNIT:New():FilterCoalitions("blue"):FilterPrefixes("Target"):FilterStart()

TaskSEAD = TASK_A2G_SEAD:New(Mission,AttackGroups,"SEAD",TargetSetUnit)
