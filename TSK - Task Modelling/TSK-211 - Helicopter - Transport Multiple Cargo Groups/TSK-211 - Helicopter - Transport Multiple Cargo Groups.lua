---
-- Name: TSK-211 - Helicopter - Transport Multiple Cargo Groups
-- Author: FlightControl
-- Date Created: 14 Apr 2017
--
-- # Situation:
-- 
-- This mission demonstrates the transport of multiple cargo groups to different zones.
-- 
-- # Test cases: 
-- 
-- 

do
  local HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

  local CommandCenter = COMMANDCENTER:New( HQ, "Bravo" )

  local Scoring = SCORING:New( "Cargo Group Transport Demonstration" )

  local Mission = MISSION
    :New( CommandCenter, "Transport", "High", "Transport 3 engineering teams to each deployment zone.", coalition.side.BLUE )
    :AddScoring( Scoring )

  local Helicopter = SET_GROUP:New():FilterPrefixes( "Transport" ):FilterStart()

  local SetCargo = SET_CARGO:New():FilterTypes( { "Engineers" } ):FilterStart()

  local EngineersCargoAlpha = CARGO_GROUP:New( GROUP:FindByName( "Engineers Alpha" ), "Engineers", "Team Alpha", 500 ):RespawnOnDestroyed( true )
  local EngineersCargoBeta = CARGO_GROUP:New( GROUP:FindByName( "Engineers Beta" ), "Engineers", "Team Beta", 500 ):RespawnOnDestroyed( true )
  local EngineersCargoGamma = CARGO_GROUP:New( GROUP:FindByName( "Engineers Gamma" ), "Engineers", "Team Gamma", 500 ):RespawnOnDestroyed( true )


  CargoTransportTask = TASK_CARGO_TRANSPORT:New( Mission, Helicopter, "Transport Engineers", SetCargo )
  
  CargoTransportTask:AddDeployZone( ZONE_POLYGON:New( "Repair Zone 1", GROUP:FindByName("Repair Zone 1") ) )
  CargoTransportTask:AddDeployZone( ZONE_POLYGON:New( "Repair Zone 2", GROUP:FindByName("Repair Zone 2") ) )
  CargoTransportTask:AddDeployZone( ZONE:New( "Delivery Zone" ) )

  CargoTransportTask:SetCargoLimit( 2 )

end	
					
