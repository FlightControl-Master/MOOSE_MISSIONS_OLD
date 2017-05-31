---
-- Name: AID-100 - AI_A2A - Normal CAP
-- Author: FlightControl
-- Date Created: 30 May 2017
--
-- # Situation:
-- The Su-27 airplane will patrol in PatrolZone.
-- It will not engage any enemy automatically.
-- 
-- # Test cases:
-- 
-- 1. Observe the Su-27 patrolling.
-- 

EWR = DETECTION_AREAS:New( SET_GROUP:New():FilterPrefixes("AWACS"):FilterStart(), 6000 )
EWR:SetFriendliesRange( 30000 )

A2ADispatcher = AI_A2A_DISPATCHER:New( EWR )
A2ADispatcher:SetCAP( "CAP A", SPAWN:New( "CAP A" ):InitLimit( 10, 20 ), ZONE:New( "Patrol Zone" ), 500, 1000, 500, 600 )
A2ADispatcher:SetINTERCEPT( "Intercept Mineralnye", SPAWN:New( "INTERCEPT A" ), 900, 1200 )
A2ADispatcher:SetINTERCEPT( "INTERCEPT B", SPAWN:New( "INTERCEPT A" ), 900, 1200 )

