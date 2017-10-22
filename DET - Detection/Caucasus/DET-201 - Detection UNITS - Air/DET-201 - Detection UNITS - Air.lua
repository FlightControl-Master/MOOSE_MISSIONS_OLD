---
-- Name: DET-201 - Detection UNITS - Air
-- Author: FlightControl
-- Date Created: 03 May 2017
--
-- # Situation:
--
-- Demonstrates the detection of units.
-- 
-- A Set of Recce are detecting a approaching airplanes.
-- Select one of the blue Recce, and press F7. Watch the reporting of the detection evolve.
-- The enemy is approaching.
-- 
-- # Test cases:
-- 
-- 1. Observe the detection reporting of both the Recce.
-- 2. Eventually all units should be detected by both Recce.

RecceSetGroup = SET_GROUP:New():FilterPrefixes( "Recce" ):FilterStart()

HQ = GROUP:FindByName( "HQ" )

CC = COMMANDCENTER:New( HQ, "HQ" )

RecceDetection = DETECTION_UNITS:New( RecceSetGroup )
RecceDetection:InitDetectRadar(true)

RecceDetection:Start()

--- OnAfter Transition Handler for Event Detect.
-- @param Functional.Detection#DETECTION_UNITS self
-- @param #string From The From State string.
-- @param #string Event The Event string.
-- @param #string To The To State string.
function RecceDetection:OnAfterDetect(From,Event,To)

  self:E("Detect")

  local DetectionReport = RecceDetection:DetectedReportDetailed()

  CC:MessageToAll( DetectionReport, 15, "" )
end

