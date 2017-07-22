---
-- Name: SPA-024 - Ground Ops - Arrays
-- Author: FlightControl
-- Date Created: 19 Jul 2017
--
-- # Situation:
--
-- At Gudauta spawn multiple ground vehicles, in an array.
-- 
-- # Test cases:
-- 
-- 1. Observe that the ground vehicles are spawned at the position declared within the mission editor.
-- 2. The vehicles should spawn according the array parameters.



-- Tests Gudauta
-- -------------
Spawn_Vehicle = SPAWN
  :New( "Spawn Vehicles" )
  :InitLimit( 12, 60 )
  :InitArray( 90, 10, 10, 10 )





