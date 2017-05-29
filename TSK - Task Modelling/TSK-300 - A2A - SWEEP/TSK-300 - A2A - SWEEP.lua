---
-- Name: TSK-300 - A2A - SWEEP
-- Author: FlightControl
-- Date Created: 28 May 2017
--
-- # Situation:
-- 
-- This mission demonstrates the Sweeping of target areas.
-- 
-- # Test cases: 

do
  local HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

  local CommandCenter = COMMANDCENTER:New( HQ, "Bravo" )

  local Scoring = SCORING:New( "Target Sweeping Demonstration" )

  local Mission = MISSION
    :New( CommandCenter, "Sweeping", "Primary", "Wait until the detected targets get undetected. And see if a SWEEP task is allocated.", coalition.side.BLUE )
    :AddScoring( Scoring )

  AttackGroups = SET_GROUP:New():FilterCoalitions( "red" ):FilterPrefixes( "Attack" ):FilterStart()
  
  TargetSetUnit = SET_UNIT:New():FilterCoalitions( "blue" ):FilterPrefixes( "Target" ):FilterStart()
  
  TaskSWEEP = TASK_SWEEP:New( Mission, AttackGroups, "SWEEP", TargetSetUnit )

end	
					
