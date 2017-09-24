-- Name: RAT-010 - Traffic at McCarran International
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- We want to generate some random air traffic at McCarran International Airport.
-- 
-- # Test cases:
--
-- 1. KC-135 aircraft are spawned at zones north and east heading to McCarran. 
-- 2. E-3A aircraft are spawned at McCarran with random destinations.
-- 3. Yak-40 aircraft are spawned at random airports heading for McCarran.
-- 3. TF-51D aircraft are spawned at Henderson, Boulder City or Echo Bay heading for McCarran.

-- Create RAT object from KC-135 template.
local kc135=RAT:New("RAT_KC135")

-- Set departure zones. We need takeoff "air" for that.
kc135:SetDeparture({"RAT Zone North", "RAT Zone East"})

-- Set spawn in air.
kc135:SetTakeoff("air")

-- Aircraft will fly to McCarran
kc135:SetDestination("McCarran International Airport")

-- Spawn two aircraft.
kc135:Spawn(2)


-- Create RAT object from E-3A template.
local e3=RAT:New("RAT_E3")

-- Aircraft are spawned at McCarran. Destinations are random.
e3:SetDeparture("McCarran International Airport")

-- Enable respawn after landing with a delay of six minutes.
e3:RespawnAfterLanding(360)

-- Spawn two aircraft.
e3:Spawn(2)


-- Create RAT object from Yak-40 template.
local yak=RAT:New("RAT_YAK")

-- These are the airports a Yak-40 gets a parking slot.
yak:SetDeparture({"Tonopah Airport", "Tonopah Test Range Airfield", "Henderson Executive Airport", "Nellis AFB", "Groom Lake", "Laughlin Airport"})

-- Destination McCarran.
yak:SetDestination("McCarran International Airport")

-- Spawn eight Yak-40.
yak:Spawn(8)


-- Create RAT object from E-3A template.
local tf51=RAT:New("RAT_TF51")

-- Departure airport will be chosen from this list. 
tf51:SetDeparture({"Henderson Executive Airport", "Boulder City Airport", "Echo Bay"})

-- All will fly to McCarran.
tf51:SetDestination("McCarran International Airport")

-- Spawn four TF-51D
tf51:Spawn(4)
