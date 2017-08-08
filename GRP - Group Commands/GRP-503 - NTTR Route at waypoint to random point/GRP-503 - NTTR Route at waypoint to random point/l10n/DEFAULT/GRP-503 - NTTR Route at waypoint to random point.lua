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

function VehicleGroup.ReRoute( RoutedGroup )

  RoutedGroup:E( "Routing" )

  local FromWP = RoutedGroup:GetCoordinate():WaypointGround()
  
  local ZoneNumber = math.random( 1, #ZoneList )
  
  local ZoneTo = ZoneList[ ZoneNumber ] -- Core.Zone#ZONE
  
  local ToCoord = ZoneTo:GetCoordinate()
  local ToWP = ToCoord:WaypointGround( 72, "Vee" )
  
  local TaskReRoute = RoutedGroup:TaskFunction( "VehicleGroup.ReRoute" )
  RoutedGroup:SetTaskWaypoint( ToWP, TaskReRoute )
  
  Route = { FromWP, ToWP }
  
  RoutedGroup:Route( Route, 1 )

end

VehicleGroup.ReRoute( VehicleGroup )






