---
-- Name: TSK-212 - Helicopter - Cargo handle PickedUp and Deployed events
-- Author: FlightControl
-- Date Created: 14 Apr 2017
--
-- # Situation:
-- 
-- This mission demonstrates the transport of multiple cargo groups to different zones.
-- Task success is verified by handling the PickedUp and Deployed events of the TASK_CARGO_TRANSPORT object.
-- 
-- 
-- 
-- # Test cases: 
-- 
-- 1. Observe that if a cargo has been transported to a deployment zone, that a message is sent to the coalition of a succesful transport.
-- 2. Observe that if all cargo has been transported to all deployment zones, that mission success is accomplished.

do
  local HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

  local CommandCenter = COMMANDCENTER:New( HQ, "Bravo" )

  local Scoring = SCORING:New( "Cargo Group Transport Demonstration" )

  local Mission = MISSION
    :New( CommandCenter, "Transport", "High", "Transport 3 engineering teams to each deployment zone.", coalition.side.BLUE )
    :AddScoring( Scoring )

  local Helicopter = SET_GROUP:New():FilterPrefixes( "Transport" ):FilterStart()

  local SetCargo = SET_CARGO:New():FilterTypes( { "Engineers" } ):FilterStart()

  local EngineersCargoAlpha = CARGO_GROUP:New( GROUP:FindByName( "Engineers Alpha" ), "Engineers", "Team Alpha", 500 )
  local EngineersCargoBeta = CARGO_GROUP:New( GROUP:FindByName( "Engineers Beta" ), "Engineers", "Team Beta", 500 )
  local EngineersCargoGamma = CARGO_GROUP:New( GROUP:FindByName( "Engineers Gamma" ), "Engineers", "Team Gamma", 500 )


  CargoTransportTask = TASK_CARGO_TRANSPORT:New( Mission, Helicopter, "Transport Engineers", SetCargo )
  
  local RepairZone1 = ZONE_POLYGON:New( "Repair Zone 1", GROUP:FindByName("Repair Zone 1") )
  local RepairZone2 = ZONE_POLYGON:New( "Repair Zone 2", GROUP:FindByName("Repair Zone 2") )
  local DeliveryZone = ZONE:New( "Delivery Zone" ) 
  
  CargoTransportTask:AddDeployZone( RepairZone1 )
  CargoTransportTask:AddDeployZone( RepairZone2 )
  CargoTransportTask:AddDeployZone( DeliveryZone )

  --- OnAfter Transition Handler for Event CargoDeployed.
  -- @function [parent=#TASK_CARGO_TRANSPORT] OnAfterCargoDeployed
  -- @param #TASK_CARGO_TRANSPORT self
  -- @param #string From The From State string.
  -- @param #string Event The Event string.
  -- @param #string To The To State string.
  -- @param Wrapper.Unit#UNIT TaskUnit The Unit (Client) that Deployed the cargo. You can use this to retrieve the PlayerName etc.
  -- @param Core.Cargo#CARGO Cargo The Cargo that got PickedUp by the TaskUnit. You can use this to check Cargo Status.
  -- @param Core.Zone#ZONE DeployZone The zone where the Cargo got Deployed or UnBoarded.
  function CargoTransportTask:OnAfterCargoDeployed( From, Event, To, TaskUnit, Cargo, DeployZone )
  
    CommandCenter:MessageToCoalition( "Cargo " .. Cargo:GetName() .. " got successfully transported." )
    
    if DeployZone:GetName() == RepairZone1:GetName() then
      local Convoy = GROUP:FindByName( "Convoy" )
      if Convoy and not Convoy:IsAlive() then
        Convoy:Activate()
      end
    end

    if DeployZone:GetName() == RepairZone2:GetName() then
      local Sam = GROUP:FindByName( "RepairSam" )
      if Sam and not Sam:IsAlive() then
        Sam:Activate()
      end
    end
    
    if CargoTransportTask:IsAllCargoTransported() then
      CargoTransportTask:Success()
    end
  
  end
  
end	
					
