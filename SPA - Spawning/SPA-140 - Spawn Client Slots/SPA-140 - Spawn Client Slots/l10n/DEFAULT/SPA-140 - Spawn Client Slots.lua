---
-- Name: SPA-140 - Spawn Client Slots
-- Author: FlightControl
-- Date Created: 30 Aug 2017
--
-- # Situation:
--
-- A plane will be spawned Uncontrolled and later one will be spawned Controlled.
-- Only the Controlled plane will move, the other will remain idle at the parking spot.
-- 
-- # Test cases:
-- 

-- Create the SPAWN object looking for the group (template) "Plane".
SpawnPlane = SPAWN:New( "Plane" )

-- Spawn the UnControlled Group
UnControlledPlane = SpawnPlane:SpawnClientAtAirbase( AIRBASE:FindByName( AIRBASE.Caucasus.Kutaisi ) )

