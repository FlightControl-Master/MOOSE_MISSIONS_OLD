-- Name: RAT-007 - Commute
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- Spawn several aircraft of the same type at Mozdok and let them fly to Mineralnye Vody.
-- Once the aircraft arrives at its destination, it will be respawned there and fly back to Mozdok.
-- Note that:
-- We do NOT have to set a departure or destination airports. If we don't, the first departure and destination are random.
-- Commute() also works for random destination and departure airports. But once they are chosen, aircraft will only commute between those.
-- Also note that Commute() does NOT work with spawn in air since the departure airport is not defined then.     
-- 
-- # Test cases:
-- 
-- 1. Observe two C-17A being spawned at Mozdok and fly back and forth between Mozdok and Mineralnye Vody until the end of time.

-- Create RAT object. The only required parameter is the name of the template group in the mission editor.
local c17=RAT:New("RAT_C17")

-- Set Gudauta as departure airport.
c17:SetDeparture("Mozdok")

-- Set Mineralnye Vody as destination.
c17:SetDestination("Mineralnye Vody")

-- This makes aircraft respawn at their destination airport and fly back to its departure. Hence, departure cannot be in air.
c17:Commute()

-- Spawn two aircraft.
c17:Spawn(2)