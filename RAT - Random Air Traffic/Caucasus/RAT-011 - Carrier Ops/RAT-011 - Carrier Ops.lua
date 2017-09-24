-- Name: RAT-011 - Carrier Ops
-- Author: funkyfranky
-- Date Created: 24 Sep 2017
--
-- # Situation:
--
-- Spawn aircraft flying to and from aircraft carriers
-- 
-- # Test cases:
--
-- 1. Observe two SU-33 taking of from Novorossiysk and fly to the Kuznetsov.
-- 2. Observe two F-14A taking of from the Carl Vinson flying into Batumi.  

-- Create RAT object from Su-33 template.
local su33=RAT:New("RAT_SU33")

-- Huey departing from FARP Berlin.
su33:SetDeparture({"Novorossiysk"})

-- Flying to Normandy.
su33:SetDestination({"Kuznetsov"})

-- Take-off with engines on.
su33:SetTakeoff("hot")

-- Spawn two aircraft.
su33:Spawn(2)


-- Create RAT object from Su-33 template.
local f14=RAT:New("RAT_F14")

-- Huey departing from FARP Berlin.
f14:SetDeparture({"Carl Vinson"})

-- Flying to Normandy.
f14:SetDestination({"Batumi"})

-- Take-off with engines on.
f14:SetTakeoff("hot")

-- Spawn two aircraft.
f14:Spawn(2)