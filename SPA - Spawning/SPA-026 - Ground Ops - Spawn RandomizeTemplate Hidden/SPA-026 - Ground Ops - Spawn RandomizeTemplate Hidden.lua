-- Name: SPA-026 - Ground Ops - Spawn RandomizeTemplate Hidden
-- Author: FlightControl
-- Date Created: 06 Sep 2017
--
-- # Situation:
--
-- At Gudauta spawn a ground vehicle, hidden, based on a randomized template.
-- 
-- # Test cases:
-- 
-- 1. Observe that a random ground vehicle is spawned and his hidden.



-- Tests Gudauta
-- -------------
-- Spawn a gound vehicle...

Templates = { "A", "B" }

Spawn_Vehicle_1 = SPAWN:New( "Vehicle" )
Spawn_Vehicle_1:InitRandomizeTemplate( Templates )
Spawn_Group_1 = Spawn_Vehicle_1:Spawn()



