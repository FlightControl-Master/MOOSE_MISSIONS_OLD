---
-- Name: DES-011 - Designation of AREAS - Empty Set with Threat Levels
-- Author: FlightControl
-- Date Created: 15 May 2017
--
-- # Situation:
--
-- Demonstrates the designation of units, which are grouped in AREAs.
-- 
-- A Set of Recce are detecting a large group of units.
-- This test is about not failing the process when the Detected Set is empty, and the LaseOn is activated ...
-- 
-- # Test cases:
-- 
--   - Check nothing is detected, and put lase on.


RecceSetGroup = SET_GROUP:New():FilterPrefixes( "Recce" ):FilterStart()

HQ = GROUP:FindByName( "HQ" )

CC = COMMANDCENTER:New( HQ, "HQ" )

-- Let the RecceSetGroup vehicles in the collection detect targets and group them in AREAS of 1000 meters.
RecceDetection = DETECTION_AREAS:New( RecceSetGroup, 1000 )

-- Create a Attack Set, which contains the human player client slots and CA vehicles.
AttackSet = SET_GROUP:New():FilterPrefixes("Attack"):FilterStart()

RecceDesignation = DESIGNATE:New( CC, RecceDetection, AttackSet )

-- This sets the threat level prioritization on
RecceDesignation:SetThreatLevelPrioritization( true )

-- Set the possible laser codes.
RecceDesignation:SetLaserCodes({1113,1131,1256})

-- Start the detection process in 5 seconds.
RecceDesignation:__Detect( -5 )

