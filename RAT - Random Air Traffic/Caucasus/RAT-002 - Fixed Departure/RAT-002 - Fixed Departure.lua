-- Name: RAT-002 - Fixed Departure
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- Spawn several aircraft of the same type at Gudauta and let them travel to random airports on the map. 
-- 
-- # Test cases:
-- 
-- 1. Observe five Yak-40 aircraft being spawned at Gudauta. Destination airport for each aircraft is random.
--    After the aircraft arrive at their destination they get despawned and then respawned again at Gudauta. But the next destination is random again.

-- Create RAT object. The only required parameter is the name of the template group in the mission editor.
local yak=RAT:New("RAT_Yak")

-- Set destination airport.
yak:SetDeparture("Gudauta")

-- Spawn five aircraft.
yak:Spawn(5)

