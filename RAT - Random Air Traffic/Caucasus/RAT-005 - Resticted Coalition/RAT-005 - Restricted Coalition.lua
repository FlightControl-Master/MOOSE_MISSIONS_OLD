-- Name: RAT-005 - Restricted Coalition
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- Spawn several aircraft of the same type at airports belonging to a certain coalition.
-- In the mission editor, we have set Sochi-Adler, Gelendzhik, Batumi, Senaki-Kolkhi and Kutaisi to red.
-- Likewise, Tbilisi-Lochini, Beslan, Nalchik, Mozdok and Mineralnye-Vody were set to blue.
-- 
-- # Test cases:
-- 
-- 1. Observe three Yak-40 aircraft being spawned at red airports only. The will also only get destination airports belonging to that coalition.
-- 2. Observe three Yak-40 being spawned at blue airports only. The coalition of the aircraft is changed manually.

-- Create RAT object. Additionally, to the template group name we give the group an alias to be able to distinguish to another group created from this template.
local yak=RAT:New("RAT_Yak", "Yak Red")

-- This restricts the possible departure and destination airports the airports belonging to the red coalition.
-- Here it is important that in the mission editor enough (>2) airports have been set to red! Otherwise there will be no possible departure and/or destination airports.
yak:SetCoalition("sameonly")

-- Explicitly exclude Senaki from possible departures and destinations.
yak:ExcludedAirports("Senaki-Kolkhi")

-- Spawn three aircraft.
yak:Spawn(3)



-- Create RAT object. Alias is "Yak Blue". If the same template is used multiple times, it is important to give each RAT object an indiviual name!
local yakblue=RAT:New("RAT_Yak", "Yak Blue")

-- Change coalition of Yak to blue.
yakblue:SetCoalitionAircraft("blue")

-- This restricts the possible departure and destination airports the airports belonging to the blue coalition since the coalition is changed manually.
yakblue:SetCoalition("sameonly")

-- We also change the livery of these groups. If a table of liveries is given, each spawned group gets a random livery.
yakblue:Livery({"Georgian Airlines"})

-- Explicitly exclude Nalchik from possible departures and destinations.
yakblue:ExcludedAirports({"Nalchik", "Mozdok"})

-- Spawn three aircraft.
yakblue:Spawn(3)