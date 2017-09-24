-- Name: RAT-001 - Basic
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- Spawn several aircraft at random airports on the map. 
-- 
-- # Test cases:
-- 
-- 1. Observe five Yak-40 aircraft being spawned at random airports of the map and fly to random destination airports.
--    After the aircraft arrive at their destination they get despawned and then respawned at a new random airport with new random destination.

-- Create RAT object. The only required parameter is the name of the template group in the mission editor.
local yak=RAT:New("RAT_Yak")

-- Spawn five aircraft.
yak:Spawn(5)