--- This makes a vehicle drive to random zones when a waypoint has been reached.
-- Name: GRP - Group Commands/GRP-503 - NTTR Route at waypoint to random point
-- Author: FlightControl
-- Date Created: 08 Aug 2017


local ZoneList = {
  ZONE:New( "ZONE1" ),
  ZONE:New( "ZONE2" ),
  ZONE:New( "ZONE3" ),
  ZONE:New( "ZONE4" ),
  ZONE:New( "ZONE5" ),
}

VehicleGroup = GROUP:FindByName( "Vehicle #001" )

--- @param Wrapper.Group#GROUP RoutedGroup
function ReRoute( VehicleGroup )

  VehicleGroup:E( "Routing" )

  local ZoneNumber = math.random( 1, #ZoneList )
  VehicleGroup:E( ZoneNumber )
  
  local FromCoord = VehicleGroup:GetCoordinate() -- Core.Point#COORDINATE
  local FromWP = FromCoord:WaypointGround()

  local ZoneTo = ZoneList[ ZoneNumber ] -- Core.Zone#ZONE
  local ToCoord = ZoneTo:GetCoordinate()
  local ToWP = ToCoord:WaypointGround( 72, "Vee" )
  
  local TaskReRoute = VehicleGroup:TaskFunction( "ReRoute" )
  VehicleGroup:SetTaskWaypoint( ToWP, TaskReRoute )
  
  VehicleGroup:Route( { FromWP, ToWP }, 1 )

end

ReRoute( VehicleGroup )






