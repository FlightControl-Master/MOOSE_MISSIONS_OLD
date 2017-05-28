---
-- Name: TAD-010 - A2G Task Dispatching Destroy Test
-- Author: FlightControl
-- Date Created: 17 Mar 2017
--
-- # Situation:
-- 
-- This tests if an accepted task successful completion does finish the processes correctly.
-- It tests that a Task is successfully executed.
-- It tests that a Mission is successfully executed.
-- 
-- # Test cases: 
-- 
-- 1. Join the Attack group of RED.
-- 2. Wait until the blue tank is detected.
-- 3. A task will de defined, a CAS task.
-- 4. Join the task using the radio menus.
-- 5. Destroy the blue tank.
-- 6. Once the blue tank is destroyed, messages should appear:
--   - The task has been successfully completed.
--   - The mission has been completed.
-- 
local HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

local CommandCenter = COMMANDCENTER:New( HQ, "Lima" )

local Scoring = SCORING:New( "Detect Demo" )

local Mission = MISSION
  :New( CommandCenter, "Overlord", "Primary", "Attack the blue tank for mission completion. Remember to join the task when the tank has been detected, or you won't get any task and mission scores!", coalition.side.RED )
  :AddScoring( Scoring )

local FACSet = SET_GROUP:New():FilterPrefixes( "FAC" ):FilterCoalitions("red"):FilterStart()

local FACAreas = DETECTION_UNITS:New( FACSet )


local AttackGroups = SET_GROUP:New():FilterCoalitions( "red" ):FilterPrefixes( "Attack" ):FilterStart()

TaskDispatcher = TASK_A2G_DISPATCHER:New( Mission, AttackGroups, FACAreas )

-- Now this is REALLY neat. I set the goal of the mission to be the destruction of Target.
-- This is just an example, but many more examples can follow...

-- Every time a Task becomes Successful, it will trigger the MissionGoals event of the Mission object.
-- The mission designer NEED TO OVERRIDE the OnAfterMissionGoals to flag the Mission to completion!

function Mission:OnAfterMissionGoals( From, Event, To )
  self:E( { From, Event, To } )
  local TargetGroup = GROUP:FindByName( "Target" )
  if TargetGroup and not TargetGroup:IsAlive() then
    Mission:GetCommandCenter():MessageToCoalition( "Mission Complete! All targets have been destroyed!" )
    Mission:Complete()
  end
end
