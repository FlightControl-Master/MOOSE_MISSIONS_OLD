-- Name: RAT-008 - Spawn in Air
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- Spawn several aircraft above airports or at zones pre-defined in the mission editor.
-- Note that if takeoff is set to air:
-- Airports are treated like zones with a certain radius.
-- Spawn happens at a random point anywhere within the zone.
--
-- 
-- # Test cases:
--
-- 1. Obsever ten Yak-40 being spawned in air near random airports of the map.
-- 2. Observe five C-17A being spawned within Zones "RAT Zone West", and "RAT Zone North".
-- 3. Observe eight IL76 being spawned within RAT Zone North or somewhere near Anapa Vityazevo airport.


-- Create RAT object from Yak-40 template.
local yak=RAT:New("RAT_YAK")

-- Set takeoff type to air.
yak:SetTakeoff("air")

-- Spawn ten Yak-40s.
yak:Spawn(10)


-- Create RAT object from C-17A template.
local c17=RAT:New("RAT_C17")

-- Set takeoff type to air.
c17:SetTakeoff("air")

-- Set departure zones for C-17.
c17:SetDeparture({"RAT Zone West", "RAT Zone South"})

-- Spawn five C-17s.
c17:Spawn(5)


-- Create RAT object from IL76 template.
local il76=RAT:New("RAT_IL76")

-- Set takeoff type to air.
il76:SetTakeoff("air")

-- Set departure zones for C-17. You can mix zone names and airport names.
il76:SetDeparture({"RAT Zone North", "Anapa-Vityazevo"})

-- Spawn eight C-17s.
il76:Spawn(8)