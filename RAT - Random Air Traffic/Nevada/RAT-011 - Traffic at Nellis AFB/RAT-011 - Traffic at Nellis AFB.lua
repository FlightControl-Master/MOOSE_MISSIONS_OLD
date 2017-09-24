-- Name: RAT-011 - Traffic at Nellis AFB
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- We want to generate some random air traffic at Nellis AFB.
-- 
-- # Test cases:
--
-- 1. F-15C are spawned at Nellis with desitation Tonopah, Groom Lake or Creech.
-- 2. A-10C are spawned at Nellis with desitation Tonopah, Groom Lake or Creech.
-- 3. F/A-18C are spawned at Tonopah, Groom Lake or Creech and fly to Nellis.
-- 4. KC-135 are spawned in air at two zones heading for Nellis.

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Create RAT object from F-15C template.
local f15=RAT:New("RAT_F15C")

-- Departure Nellis.
f15:SetDeparture("Nellis AFB")

-- Destination Tonopah, Groom Lake or Creech.
f15:SetDestination({"Tonopah Test Range Airfield", "Groom Lake AFB", "Creech AFB"})

-- Spawn three flights.
f15:Spawn(3)

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

local a10=RAT:New("RAT_A10C")

-- Departure Nellis.
a10:SetDeparture("Nellis AFB")

-- Destination Tonopa, Groom Lake or Creech.
a10:SetDestination({"Tonopah Test Range Airfield", "Groom Lake AFB", "Creech AFB"})

-- Spawning will happen 60 seconds after mission start.
a10:SetSpawnDelay(60)

-- Spawn three flights.
a10:Spawn(3)

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Creat RAT object from F/A-18C template.
local f18=RAT:New("RAT_F18C")

-- Departure airports.
f18:SetDeparture({"Tonopah Test Range Airfield", "Groom Lake AFB", "Creech AFB"})

-- Destination Nellis.
f18:SetDestination("Nellis AFB")

-- Spawn three flights.
f18:Spawn(3)

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Create RAT object from KC-135 template.
local kc135=RAT:New("RAT_KC135")

-- Set departure zones. We need takeoff "air" for that.
kc135:SetDeparture({"RAT Zone North", "RAT Zone East"})

-- Set spawn in air.
kc135:SetTakeoff("air")

-- Aircraft will fly to McCarran
kc135:SetDestination("Nellis AFB")

-- Spawning of aircraft will happen in 2 minute intervalls.
kc135:SetSpawnInterval(120)

-- Spawn two aircraft.
kc135:Spawn(2)

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Store time at mission start
local T0=timer.getTime()

-- Send message with current misson time to all coalisions
local function print_mission_time()
  local Tnow=timer.getTime()
  local mission_time=Tnow-T0
  local mission_time_minutes=mission_time/60
  local mission_time_seconds=mission_time%60
  local text=string.format("Mission Time: %i:%02d", mission_time_minutes,mission_time_seconds)
  MESSAGE:New(text, 5):ToAll()
end

-- Start scheduler to report mission time.
local Scheduler_Mission_Time = SCHEDULER:New(nil, print_mission_time, {}, 0, 10)