---
-- Name: CGO-102 - Group Unboarding
-- Author: FlightControl
-- Date Created: 13 Apr 2017
--
-- # Situation:
-- 
-- A cargo group called Infantry with Engineers is unboarding the Carrier "Carrier".
-- 
-- # Test cases: 
-- 
-- 1. Observe that the cargo is unboarding.
-- 

local InfantryGroup = GROUP:FindByName( "Infantry" )

local InfantryCargo = CARGO_GROUP:New( InfantryGroup, "Engineers", "Infantry Engineers", 2000 )

local CargoCarrier = UNIT:FindByName( "Carrier" )

-- This will Load immediately the Cargo into the Carrier, regardless where the Cargo is.
InfantryCargo:Load( CargoCarrier )

-- This will Unboard the Cargo from the Carrier.
InfantryCargo:UnBoard()