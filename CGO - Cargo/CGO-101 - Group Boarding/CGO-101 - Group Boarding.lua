---
-- Name: CGO-101 - Group Boarding
-- Author: FlightControl
-- Date Created: 13 Apr 2017
--
-- # Situation:
-- 
-- A cargo group called Infantry with Engineers is boarding the Carrier "Carrier".
-- 
-- # Test cases: 
-- 
-- 1. Observe that the cargo is boarding.
-- 

local InfantryGroup = GROUP:FindByName( "Infantry" )

local InfantryCargo = CARGO_GROUP:New( InfantryGroup, "Engineers", "Infantry Engineers", 2000 )

local CargoCarrier = UNIT:FindByName( "Carrier" )

-- This call will make the Cargo run to the CargoCarrier.
-- Upon arrival at the CargoCarrier, the Cargo will be Loaded into the Carrier.
-- This process is now fully automated.
InfantryCargo:Board( CargoCarrier, 25 ) 

