---
-- Name: SPA-023 - Ground Ops - SpawnStart and SpawnStop
-- Author: FlightControl
-- Date Created: 10 Jan 2017
--
-- # Situation:
--
-- At Gudauta spawn multiple ground vehicles, in a scheduled fashion.
-- The schedule is immediately stopped and started.
-- 
-- # Test cases:
-- 
-- 1. Observe that the ground vehicles are spawned at the position declared within the mission editor.
-- 2. The vehicles should spawn according the scheduler parameters.



-- Tests Gudauta
-- -------------
Spawn_Vehicle = SPAWN:New( "Spawn Vehicle 1" ):SpawnScheduled( 10, 0.5 ):SpawnScheduleStop()

Spawn_Vehicle:SpawnScheduleStart()




