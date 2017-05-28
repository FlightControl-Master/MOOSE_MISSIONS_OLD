---
-- Name: TAD-011 - A2G Task Dispatching WWII Test
-- Author: FlightControl
-- Date Created: 17 Mar 2017
--
-- # Situation:
-- 
-- This tests if an accepted task successful completion does finish the processes correctly.
-- It tests that a Task is successfully executed.
-- It tests that a Mission is successfully executed.
-- 
-- Test if the Command Center is working in WWII mode, and that it selects the closest Reference points for each target...
-- Join both tasks sequentially (abort when done), and see if the reference points are selected correctly, following the closest ref point logic.
-- 
-- # Test cases: 
-- 
-- 1. Join the Attack group of RED.
-- 2. Wait until the blue tank is detected.
-- 3. Three tasks will de defined, CAS and BAI tasks.
-- 4. Join each task using the radio menus.
-- 5. Observe that the correct WWII compatible reference points are shown.

local HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

local CommandCenter = COMMANDCENTER:New( HQ, "Bravo" )
CommandCenter:SetModeWWII()
CommandCenter:SetReferenceZones( "Village" )

local Scoring = SCORING:New( "WWII Reference Points Test" )

local Mission = MISSION
  :New( CommandCenter, 
        "Overlord", 
        "Primary", 
        "Join each task as a result of the detected targets reported. " .. 
        "Observe that the correct Targets are reported from the correct reference points! " ..
        "\n1. Target #001 -> Village#Dziguri" ..
        "\n2. Target #002 -> Village#Horshi" ..
        "\n3. Target #003 -> Village#Machkhvareti"
        , coalition.side.RED )
  :AddScoring( Scoring )

local FACSet = SET_GROUP:New():FilterPrefixes( "FAC" ):FilterCoalitions( "red" ):FilterStart()

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
