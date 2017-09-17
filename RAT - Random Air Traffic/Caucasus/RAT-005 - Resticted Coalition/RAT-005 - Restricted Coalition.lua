-- Name: RAT-005 - Restricted Coalition
-- Author: funkyfranky
-- Date Created: 16 Sep 2017
--
-- # Situation:
--
-- Spawn several aircraft of the same type at airports belonging to a certain coalition. In this case only red airports.
-- In the mission editor, we have set Sochi-Adler, Gelendzhik, Batumi and Kutaisi to red. These are the ONLY valid departure and destination airports.   
-- 
-- # Test cases:
-- 
-- 1. Observe five Yak-40 aircraft being spawned at red airports only. The will also only get destination airports belonging to that coalition.

-- Create RAT object. The only required parameter is the name of the template group in the mission editor.
local yak=RAT:New("RAT_Yak")

-- This restricts the possible departure and destination airports the airports belonging to the red coalition.
-- Here it is important that in the mission editor enough (>2) airports have been set to red! Otherwise there will be no possible departure and/or destination airports.
yak:SetCoalition("redonly")

-- Spawn five aircraft.
yak:Spawn(5)