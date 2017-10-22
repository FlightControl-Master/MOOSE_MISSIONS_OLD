---
-- Name: DET-250 - Detection AREAS
-- Author: FlightControl
-- Date Created: 19 Oct 2017
--
-- # Situation:
--
-- Demonstrates the detection of units grouped per area.
-- 
-- One JTAC is detecting units...
-- 
-- # Test cases:
-- 
-- 2. Observe the detection report done by the JTAC.

RecceSetGroup1 = SET_GROUP:New():FilterPrefixes( "Recce" ):FilterStart()

HQ = GROUP:FindByName( "HQ" )

CC = COMMANDCENTER:New( HQ, "HQ" )

Recce = DETECTION_AREAS:New( RecceSetGroup1, 1000 )
--Recce:BoundDetectedZones()

Recce:Start()

--- OnAfter Transition Handler for Event Detect.
-- @param Functional.Detection#DETECTION_UNITS self
-- @param #string From The From State string.
-- @param #string Event The Event string.
-- @param #string To The To State string.
function Recce:OnAfterDetect(From,Event,To)

  local DetectionReport = Recce:DetectedReportDetailed()

  HQ:MessageToAll( DetectionReport, 15, "Detected Targets:" )
end

