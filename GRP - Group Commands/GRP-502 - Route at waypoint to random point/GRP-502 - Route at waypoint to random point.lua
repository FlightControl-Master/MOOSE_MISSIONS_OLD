--- This makes a vehicle fly to random zones when a waypoint has been reached.
-- Name: GRP - Group Commands/GRP-502 - Route at waypoint to random point
-- Author: FlightControl
-- Date Created: 08 Aug 2017


local ZoneList = { 
  ZONE:New( "ZONE1" ), 
  ZONE:New( "ZONE2" ), 
  ZONE:New( "ZONE3" ), 
  ZONE:New( "ZONE4" ), 
  ZONE:New( "ZONE5" ) 
}

GroundGroup = GROUP:FindByName( "Vehicle" )

--- @param Wrapper.Group#GROUP GroundGroup
function RouteToZone( Vehicle, ZoneRoute )

  local Route = {}
  
  Vehicle:E( { ZoneRoute = ZoneRoute } )
  
  Vehicle:MessageToAll( "Moving to zone " .. ZoneRoute:GetName(), 10 )

  -- Get the current coordinate of the Vehicle
  local FromCoord = Vehicle:GetCoordinate()
  
  -- Select a random Zone and get the Coordinate of the new Zone.
  local RandomZone = ZoneList[ math.random( 1, #ZoneList ) ] -- Core.Zone#ZONE
  local ToCoord = RandomZone:GetCoordinate()
  
  -- Create a "ground route point", which is a "point" structure that can be given as a parameter to a Task
  Route[#Route+1] = FromCoord:RoutePointGround( 72 )
  Route[#Route+1] = ToCoord:RoutePointGround( 60, "Vee" )
  
  local TaskRouteToZone = Vehicle:TaskFunction( "RouteToZone", RandomZone )
  
  Vehicle:SetTaskAtWaypoint( Route, #Route, TaskRouteToZone ) -- Set for the given Route at Waypoint 2 the TaskRouteToZone.

  Vehicle:Route( Route, math.random( 10, 20 ) ) -- Move after a random seconds to the Route. See the Route method for details.
  
end

RouteToZone( GroundGroup, ZoneList[1] )

