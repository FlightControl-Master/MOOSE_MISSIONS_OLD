--- This makes a vehicle drive its route in a repetitive way.
-- Name: GRP-550 - Patrol a route
-- Author: FlightControl
-- Date Created: 24 Sep 2017


-- Find the Vehicle and create a GROUP object.
Vehicle = GROUP:FindByName( "Vehicle" )

-- Patrol the route of the Vehicle.
Vehicle:PatrolRoute()

-- Find the Ship and create a GROUP object.
Ship = GROUP:FindByName( "Ship" )

-- Patrol the route of the Ship.
Ship:PatrolRoute()
