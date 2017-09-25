--- This makes a vehicle drive its route using the waypoints of the route and selecing random points on the route.
-- Name: GRP-551 - Patrol to random points of a route
-- Author: FlightControl
-- Date Created: 24 Sep 2017


-- Find the Vehicle and create a GROUP object.
Vehicle = GROUP:FindByName( "Vehicle" )

-- Patrol to random points of the route at 120 km/h in "Vee" formation.
Vehicle:PatrolRouteRandom( 120, "Vee" )

-- Find the Ship and create a GROUP object.
Ship = GROUP:FindByName( "Ship" )

-- Patrol to random points of the route at 120 km/h in "Vee" formation.
Ship:PatrolRouteRandom( 120, "Vee" )
