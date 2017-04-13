---
-- Name: TSK-110 - Ground - Transport Cargo Group
-- Author: FlightControl
-- Date Created: 12 Apr 2017
--
-- # Situation:
-- 
-- This mission demonstrates the transport of a cargo group.
-- 
-- # Test cases: 
-- 
-- 

do
  local HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

  local CommandCenter = COMMANDCENTER:New( HQ, "Bravo" )

  local Scoring = SCORING:New( "Cargo Group Transport Demonstration" )

  local Mission = MISSION
    :New( CommandCenter, "Transport", "High", "Transport the team from Deploy Zone 1 to Deploy Zone 2", coalition.side.BLUE )
    :AddScoring( Scoring )

  local APC = SET_GROUP:New():FilterPrefixes( "Transport" ):FilterStart()

  local SetCargo = SET_CARGO:New():FilterTypes( "Engineers" ):FilterStart()

  local EngineersGroup = GROUP:FindByName( "Engineers" )
  local CargoGroup = CARGO_GROUP:New( EngineersGroup, "Engineers", "Engineers", 500 )


  CargoTransportTask = TASK_CARGO_TRANSPORT:New( Mission, APC, "Transport.001", SetCargo )
  
  CargoTransportTask:AddDeployZone( ZONE_POLYGON:New( "DeployZone1", GROUP:FindByName("DeployZone1") ) )
  CargoTransportTask:AddDeployZone( ZONE_POLYGON:New( "DeployZone2", GROUP:FindByName("DeployZone2") ) )

end	
					
