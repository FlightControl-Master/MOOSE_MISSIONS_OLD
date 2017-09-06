-- Name: SPA-025 - Ground Ops - Spawn Hidden
-- Author: FlightControl
-- Date Created: 06 Sep 2017
--
-- # Situation:
--
-- At Gudauta spawn a ground vehicle, hidden
-- 
-- # Test cases:
-- 
-- 1. Observe that the ground vehicle is spawned and his hidden.



-- Tests Gudauta
-- -------------
-- Spawn a gound vehicle...
Spawn_Vehicle_1 = SPAWN:New( "Spawn Vehicle 1" )
Spawn_Group_1 = Spawn_Vehicle_1:Spawn()



