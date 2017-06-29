---
-- Name: TAD-300 - A2A Task Dispatching DETECTION_AREAS
-- Author: FlightControl
-- Date Created: 17 May 2017
--
-- # Situation:
-- 
-- This mission demonstrates the dynamic task dispatching for Air to Air operations.
-- Intruders are flying towards the EWR units. 
-- The detection method used is the DETECTION_AREAS method, which groups detected targets per detected area.
-- 
-- # Test cases: 
-- 
-- 1. Observe the EWR's detecting targets and grouping them. 
-- 2. Check that the HQ provides menus to engage on a task set by the EWRs.
-- 
HQ = GROUP:FindByName( "HQ", "Bravo" )

CommandCenter = COMMANDCENTER:New( HQ, "Lima" )

Scoring = SCORING:New( "A2A Dispatching demo" )

Mission = MISSION
  :New( CommandCenter, "A2A Mission", "High", "Watch the air enemy units being detected.", coalition.side.RED )
  :AddScoring( Scoring )

EWRSet = SET_GROUP:New():FilterPrefixes( "EWR Red" ):FilterCoalitions("red"):FilterStart()

EWRDetection = DETECTION_AREAS:New( EWRSet, 30000 )
EWRDetection:SetFriendliesRange( 80000 )
EWRDetection:SetDetectionInterval( 30 )


AttackGroups = SET_GROUP:New():FilterCoalitions( "red" ):FilterPrefixes( "Defender" ):FilterStart()

TaskDispatcher = TASK_A2A_DISPATCHER:New( Mission, AttackGroups, EWRDetection )
TaskDispatcher:SetReportInterval( 10 )

AIDispatcher = AI_A2A_DISPATCHER_GCICAP:New( { "EWR Blue" }, 20000 )

BlueTemplates = {
  "Defender-1",
  "Defender-2"
  }

AIDispatcher:SetSquadron( "001", AIRBASE.Caucasus.Batumi, BlueTemplates, 20 )
AIDispatcher:SetSquadronGci( "001", 600, 800 )

AIDispatcher:SetSquadron( "002", AIRBASE.Caucasus.Senaki_Kolkhi, BlueTemplates, 20 )
AIDispatcher:SetSquadronGci( "002", 600, 800 )

AIDispatcher:SetSquadron( "003", AIRBASE.Caucasus.Kobuleti, BlueTemplates,20 )
AIDispatcher:SetSquadronGci( "003", 600, 800 )

AIDispatcher:SetSquadron( "004", AIRBASE.Caucasus.Kutaisi, BlueTemplates, 20 )
AIDispatcher:SetSquadronGci( "004", 600, 800 )




--- @param #TaskDispatcher self
-- @param From 
-- @param Event
-- @param To
-- @param Tasking.Task_A2A#TASK_A2A Task
-- @param Wrapper.Unit#UNIT TaskUnit
-- @param #string PlayerName
function TaskDispatcher:OnAfterAssign( From, Event, To, Task, TaskUnit, PlayerName )
  Task:SetScoreOnProgress( PlayerName, 20, TaskUnit )
  Task:SetScoreOnSuccess( PlayerName, 200, TaskUnit )
  Task:SetScoreOnFail( PlayerName, -100, TaskUnit )
end

