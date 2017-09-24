-- Name: RAT-003 - Fixed Destination
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- Spawn several aircraft of the same type at random airports and let them all travel to Sochi-Adler. 
-- 
-- # Test cases:
-- 
-- 1. Observe five Yak-40 aircraft being spawned at random airports. They will all fly to Sochi-Adler.
--    After the aircraft arrive at their destination they get despawned and then respawned at a random aiport with destination Sochi-Adler.

-- Create RAT object. The only required parameter is the name of the template group in the mission editor.
local yak=RAT:New("RAT_Yak")

-- Set destination airport.
yak:SetDestination("Sochi-Adler")

-- Spawn five aircraft.
yak:Spawn(5)

