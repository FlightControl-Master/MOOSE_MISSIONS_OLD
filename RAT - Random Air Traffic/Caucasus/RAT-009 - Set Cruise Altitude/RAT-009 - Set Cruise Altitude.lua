-- Name: RAT-009 - Set Cruise Altitude
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- Spawn several aircraft randomly but make them fly at certain cruise altitudes.
-- In the first example we specify the flight level, i.e. the altitude above sea level in hundreds of meters. 
-- There are also methods to set the cruise altitude in meters. These are used in the second example.
--
-- Note that when setting a lower bound for the cruise altitude, this automatically adjusts the minimum distance to possible destinations, since the aircraft must have enough time to climb to that alt and descent again to the destination.
-- 
-- # Test cases:
--
-- 1. Obsever five Yak-40 being spawned at random airports. They will travel to a random destination but the cruising altitude will not be below 5,000 feet and not be above 20,000 feet.
--    Most aircraft will travel at or near 10,000 ft. 
-- 2. Observe two C-17 being spawned at Tbilisi-Lochini. They will travel to a random destination but the cruise alt is set to be > 5 km.


-- Create RAT object from Yak-40 template.
local yak=RAT:New("RAT_YAK")

-- Set the minimum flight level. No aircaft will travel below this altitude.
yak:SetFLmin(50)

-- Set maximum flight level to 20,000 ft ASL. No aircraft will be assigned a cruise flight level above this altitude.
yak:SetFLmax(200)

-- Set cruise flight level to 10,000 ft. The final choise is random between FLmin and FLmax, but morst aircraft will travel at his or near this altitude.
yak:SetFLcruise(100)

-- Spawn five Yak-40s.
yak:Spawn(5)


-- Create RAT object from C-17A template.
local c17=RAT:New("RAT_C17")

-- Set departure zones for C-17.
c17:SetDeparture("Tbilisi-Lochini")

-- All aircraft will fly at least at a height of 5 km ASL.
c17:SetMinCruiseAltitude(5000)

-- Spawn two C-17s.
c17:Spawn(2)
