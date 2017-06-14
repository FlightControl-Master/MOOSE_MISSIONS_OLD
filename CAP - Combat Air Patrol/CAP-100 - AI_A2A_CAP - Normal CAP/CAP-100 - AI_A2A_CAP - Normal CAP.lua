---
-- Name: CAP-100 - AI_A2A_CAP - Normal CAP
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

local CapPlane = GROUP:FindByName( "Plane" )

local PatrolZone = ZONE:New( "Patrol Zone" )

A2ACap = AI_A2A_CAP:New( CapPlane, PatrolZone, 500, 1000, 500, 600 )

A2ACap:Patrol()

local IntruderUnit = UNIT:FindByName( "Intruder" )


A2ACap:__Engage( 120, { IntruderUnit } )