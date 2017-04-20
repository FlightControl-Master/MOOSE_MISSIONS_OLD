---
-- Name: DES-100 - Designation of UNITS
-- Author: FlightControl
-- Date Created: 02 Apr 2017
--
-- # Situation:
--
-- Demonstrates the designation of units.
-- 
-- A Set of Recce are detecting a large group of units, which are 5 km away.
-- 
-- # Test cases:
-- 


RecceSetGroup = SET_GROUP:New():FilterPrefixes( "Recce" ):FilterStart()

HQ = GROUP:FindByName( "HQ" )

CC = COMMANDCENTER:New( HQ, "HQ" )

RecceDetection = DETECTION_TYPES:New( RecceSetGroup )

AttackSet = SET_GROUP:New():FilterPrefixes("Attack"):FilterStart()

RecceDesignation = AI_DESIGNATE:New( RecceDetection, AttackSet )
RecceDesignation:SetLaserCodes({1113,1688,1131})
RecceDesignation:__Detect( -5 )

