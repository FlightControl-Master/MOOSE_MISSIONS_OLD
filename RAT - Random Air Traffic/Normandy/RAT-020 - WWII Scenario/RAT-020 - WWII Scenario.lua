-- Name: RAT-020 - WWII Scenario
-- Author: funkyfranky
-- Date Created: 16 Sep 2017
--
-- # Situation:
--
-- We want to generate some random air traffic of WWII units in 1944 Normandy.
-- In the mission editor we have defined a couple of red and blue airfields.
-- Germans are located to the east while the allies hold the western airfiels and those of southern England.
-- Note that the default setting of the RAT aircraft is to hold their weapons and to ignore enemy threads.
-- 
-- # Test cases:
--
-- 1. Four two-ship flights of Bf-109 get random routes restricted to red airfields. 
-- 2. Two two-ship flights of FW-190 similar to the Bf-109s.
-- 3. Three two-ship flights of TF-51 get random routes restricted to blue airfields.
-- 4. Two two-ship flights of Spitfires are set up analogously to the TF-51
-- 5. One two-ship flight of Spitfires is explicitly ordered to fly back and forth across the channel.

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Create RAT object from Bf-109 template.
local bf109=RAT:New("RAT_Bf109")

-- Airports are restricted to red.
bf109:SetCoalition("sameonly")

-- Spawn four Bf-109.
bf109:Spawn(4)

-- Create RAT object from FW-190 template.
local fw190=RAT:New("RAT_Fw190")

-- Again, airports restricted to red.
fw190:SetCoalition("sameonly")

-- Spawn two FW-190.
fw190:Spawn(2)

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Create RAT object from TF-51 template.
local tf51=RAT:New("RAT_TF-51")

-- Allow only blue airports for departure and destination. 
tf51:SetCoalition("sameonly")

-- We exclude ever airport across the channel.
tf51:ExcludedAirports({"Needs Oar Point", "Funtington", "Tangmere", "Ford", "Chailey"})

-- Spawn three TF-51.
tf51:Spawn(3)


-- Creat RAT object from Spitfire template.
local spit=RAT:New("RAT_Spit")

-- Blue airports only.
spit:SetCoalition("sameonly")

-- We exclude ever airport across the channel.
spit:ExcludedAirports({"Needs Oar Point", "Funtington", "Tangmere", "Ford", "Chailey"})

-- Spawn two two-ship flights.
spit:Spawn(2)

-- Create RAT object from Spitfire template.
-- NOTE that since we have already used this template, we need to give it another name.
-- This is done by the second parameter, which is the alias name for RAT aircraft.
-- In particular, this will be the name given in the F10 Menu.
-- IMPORTANT: It is no problem to reuse the same template multiple times. But each template must get its own alias!
local spit_commute=RAT:New("RAT_Spit", "RAT_Spit_Commute")

-- These Spitfires get the order fly across the channel and to commute between Chailey and Le Molay.
spit_commute:SetDeparture("Chailey")
spit_commute:SetDestination("Le Molay")
spit_commute:Commute()

-- Set another livery for these aircraft.
spit_commute:Livery("RAF, No. 126 Squadron, Harrowbeer")

-- Spawn one two-ship flight.
spit_commute:Spawn()

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------