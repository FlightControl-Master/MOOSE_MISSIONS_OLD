-- Name: RAT-004 - Fixed Departure and Destination
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- Spawn several aircraft of the same type at Guadauta or Batumi and make them fly to Gelendzhik or Beslan.
-- 
-- # Test cases:
-- 
-- 1. Observe five Yak-40 aircraft being spawned at Gudauta or Batumi. Their destination will be either Gelendzhik or Beslan.
--    After the aircraft arrive at their destination they get despawned and then respawned again at one of the defined departure airports.
--    Then they will travel to one of the defined destinations again.

-- Create RAT object. The only required parameter is the name of the template group in the mission editor.
local yak=RAT:New("RAT_Yak")

-- Set destination airports. If multiple destinations are specified, they have to be given as a table, i.e. in curly brackets {}.
yak:SetDeparture({"Gudauta", "Batumi"})

-- Set destination airports. One of these is chosen randomly as destination.
yak:SetDestination({"Gelendzhik", "Beslan"})

-- Spawn five aircraft.
yak:Spawn(5)