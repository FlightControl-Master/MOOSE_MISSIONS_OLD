--- This makes a vehicle drive its route selecting random points in a zone.
-- Name: GRP-553 - Patrol in a list of zones
-- Author: FlightControl
-- Date Created: 24 Sep 2017

-- Find the Vehicle and create a GROUP object.
Vehicle = GROUP:FindByName( "Vehicle" )

-- Patrol to random points in the trigger zones ZONEVEHICLE1, ZONEVEHICLE2, ZONEVEHICLE3, at 120 km/h in Vee format.
Vehicle:PatrolZones( { ZONE:New( "ZONEVEHICLE1" ), ZONE:New( "ZONEVEHICLE2" ), ZONE:New( "ZONEVEHICLE3" ) }, 120, "Vee" )

-- Find the Ship and create a GROUP object.
Ship = GROUP:FindByName( "Ship" )

-- Patrol to random points in the trigger zones ZONESHIP1, ZONESHIP2, ZONESHIP3, at 120 km/h in Vee format.
Ship:PatrolZones( { ZONE:New( "ZONESHIP1" ), ZONE:New( "ZONESHIP2" ), ZONE:New( "ZONESHIP3" ) }, 120, "Vee" )
