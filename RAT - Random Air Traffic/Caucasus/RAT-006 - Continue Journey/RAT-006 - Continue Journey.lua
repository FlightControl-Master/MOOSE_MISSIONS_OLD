-- Name: RAT-006 - Continue Journey
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- Spawn several aircraft of the same type at Gudauta. Each will get a random destination.
-- Once the aircraft arrives at its destination, it will be respawned there and continue its journey to another random airport.
-- Note that we do NOT have to set a departure airport.
-- 
-- # Test cases:
-- 
-- 1. Observe five Yak-40 aircraft being spawned at Gudauta. From there they will hop from airport to airport on the map.

-- Create RAT object. The only required parameter is the name of the template group in the mission editor.
local yak=RAT:New("RAT_Yak")

-- Set Gudauta as departure airport for all spawned aircraft. (Not required for ContinueJourney() to work.)
yak:SetDeparture("Gudauta")

-- This makes aircraft respawn at their destination airport instead of another random airport.
yak:ContinueJourney()

-- Spawn five aircraft.
yak:Spawn(5)