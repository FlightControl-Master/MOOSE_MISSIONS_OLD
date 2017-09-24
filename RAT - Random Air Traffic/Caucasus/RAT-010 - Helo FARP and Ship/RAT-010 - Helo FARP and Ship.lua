-- Name: RAT-010 - Helo FARP and Ship
-- Author: funkyfranky
-- Date Created: 23 Sep 2017
--
-- # Situation:
--
-- Spawn helos at FARPS or ships.
-- 
-- # Test cases:
--
-- 1. Obsever five Yak-40 being spawned at random airports. They will travel to a random destination but the cruising altitude will not be below 5,000 feet and not be above 20,000 feet.

-- Create RAT object from Huey template.
local huey1=RAT:New("RAT_HUEY", "Huey Berlin")

-- Huey departing from FARP Berlin.
huey1:SetDeparture({"FARP Berlin"})

-- Flying to Normandy.
huey1:SetDestination({"Normandy"})

-- Take-off with engines on.
huey1:SetTakeoff("hot")

-- Huey will respawn at Normandy and fly back to FARP Berlin.
huey1:Commute()

-- Huey will be spawned.
huey1:Spawn()


-- Create RAT object from Huey template.
local huey2=RAT:New("RAT_HUEY", "Huey London")

-- Huey departing from FARP London.
huey2:SetDeparture({"FARP London"})

-- Flying to Normandy.
huey2:SetDestination({"Normandy"})

-- Take-off with engines on.
huey2:SetTakeoff("hot")

-- Huey will respawn at Normandy and fly back to FARP London.
huey2:Commute()

-- Huey will be spawned.
huey2:Spawn()


-- Create RAT object from Huey template.
local huey3=RAT:New("RAT_HUEY", "Huey Anapa")

-- Huey departing from FARP London.
huey3:SetDeparture({"FARP London", "FARP Berlin", "Anapa-Vityazevo"})

-- Flying to Normandy.
huey3:SetDestination({"FARP London", "FARP Berlin", "Anapa-Vityazevo"})

-- Take-off with engines on.
huey3:SetTakeoff("hot")

-- Huey will continue its journey.
huey3:ContinueJourney()

-- Huey will be spawned.
huey3:Spawn()