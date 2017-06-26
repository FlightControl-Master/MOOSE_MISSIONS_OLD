---
-- Name: CGO-103 - Group Tranferring
-- Author: FlightControl
-- Date Created: 13 Apr 2017
--
-- # Situation:
-- 
-- A cargo group called Infantry with Engineers is tranferring from the APC "CarrierFrom" to the APC "CarrierTo".
-- 
-- # Test cases: 
-- 
-- 1. Observe that the cargo is boarding the APC "CarrierFrom".
-- 2. Observe that the cargo is unboarding the APC "CarrierFrom".
-- 3. Observe that the cargo is boarding the APC "CarrierTo".
-- 

local InfantryGroup = GROUP:FindByName( "Infantry" )

local InfantryCargo = CARGO_GROUP:New( InfantryGroup, "Engineers", "Infantry Engineers", 2000 )

local CargoCarrierFrom = UNIT:FindByName( "CarrierFrom" )

local CargoCarrierTo = UNIT:FindByName( "CarrierTo" )

-- This call will make the Cargo run to the CargoCarrier.
-- Upon arrival at the CargoCarrier, the Cargo will be Loaded into the Carrier.
-- This process is now fully automated.
InfantryCargo:Board( CargoCarrierFrom, 20 )

-- Once the Cargo has been loaded into the Carrier, drive to a point and unload the Cargo.
function InfantryCargo:OnEnterLoaded()  
  self:__UnBoard( 1 )
  self.OnEnterLoaded = nil
end

-- Once the Cargo has been unloaded from the Carrier (the Cargo has arrived to the unload gathering point), OnBoard the Cargo in the other Carrier.
function InfantryCargo:OnEnterUnLoaded() 
  self:__Board( 1, CargoCarrierTo, 20 )
  self.OnEnterUnLoaded = nil
end
