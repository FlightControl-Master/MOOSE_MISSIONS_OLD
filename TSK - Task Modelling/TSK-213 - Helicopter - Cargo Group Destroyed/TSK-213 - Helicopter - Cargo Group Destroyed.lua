---
-- Name: TSK-213 - Helicopter - Cargo Group Destroyed
-- Author: FlightControl
-- Date Created: 14 Apr 2017
--
-- # Situation:
-- 
-- This mission demonstrates the transport of a cargo group.
-- The cargo group is destroyed.
-- 
-- # Test cases: 
-- 1. Observe the destruction of the cargo.
-- 2. Board the cargo... You shouldn't be able to do that.
-- 3. There should be no error in the log.

do
  local HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

  local CommandCenter = COMMANDCENTER:New( HQ, "Bravo" )

  local Scoring = SCORING:New( "Cargo Group Transport Demonstration" )

  local Mission = MISSION
    :New( CommandCenter, "Transport", "High", "Transport the team from Deploy Zone 1 to Deploy Zone 2", coalition.side.BLUE )
    :AddScoring( Scoring )

  local Helicopter = SET_GROUP:New():FilterPrefixes( "Transport" ):FilterStart()

  local SetCargo = SET_CARGO:New():FilterTypes( { "Engineers", "APC" } ):FilterStart()

  local EngineersGroup = GROUP:FindByName( "Engineers" )
  local EngineersCargo = CARGO_GROUP:New( EngineersGroup, "Engineers", "Engineers", 500 )
  local APCGroup = GROUP:FindByName( "APC" )
  local APCCargo = CARGO_GROUP:New( APCGroup, "APC", "APC", 500 )


  CargoTransportTask = TASK_CARGO_TRANSPORT:New( Mission, Helicopter, "Transport Infantry", SetCargo )
  
  CargoTransportTask:AddDeployZone( ZONE_POLYGON:New( "DeployZone1", GROUP:FindByName("DeployZone1") ) )
  CargoTransportTask:AddDeployZone( ZONE_POLYGON:New( "DeployZone2", GROUP:FindByName("DeployZone2") ) )

end	
					
