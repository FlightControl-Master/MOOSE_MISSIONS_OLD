--- This makes a vehicle drive its route using the waypoints of the route and selecing random points on the route.
-- Name: GRP-551 - PatrolRouteRandom
-- Author: FlightControl
-- Date Created: 24 Sep 2017


Vehicle = GROUP:FindByName( "Vehicle" )

Vehicle:PatrolRouteRandom( 120, "Vee" )
