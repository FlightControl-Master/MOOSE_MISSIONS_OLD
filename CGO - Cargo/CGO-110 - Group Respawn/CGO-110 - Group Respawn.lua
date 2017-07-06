---
-- Name: CGO-110 - Group Respawn
-- Author: FlightControl
-- Date Created: 07 Jul 2017
--
-- # Situation:
-- 
-- A cargo group called Infantry with Engineers is Respawned after boarding the carrier.
-- 
-- # Test cases: 
-- 
-- 1. Observe that the cargo is Respawned after boarding the Carrier.
-- 

local InfantryGroup = GROUP:FindByName( "Infantry" )

local InfantryCargo = CARGO_GROUP:New( InfantryGroup, "Engineers", "Infantry Engineers", 2000 )

local CargoCarrier = UNIT:FindByName( "Carrier" )

-- This call will make the Cargo run to the CargoCarrier.
-- Upon arrival at the CargoCarrier, the Cargo will be Loaded into the Carrier.
-- This process is now fully automated.
InfantryCargo:Board( CargoCarrier, 25 ) 

function InfantryCargo:OnEnterLoaded()
  InfantryCargo:Respawn()
  InfantryCargo:Board( CargoCarrier, 25 )
end