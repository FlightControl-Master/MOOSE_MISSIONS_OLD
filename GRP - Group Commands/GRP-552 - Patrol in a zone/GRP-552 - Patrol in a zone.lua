--- This makes a vehicle drive its route selecting random points in a zone.
-- Name: GRP-552 - Patrol in a zone
-- Author: FlightControl
-- Date Created: 24 Sep 2017

  -- Find the Vehicle and create a GROUP object.
  Vehicle = GROUP:FindByName( "Vehicle" )
  
  -- Patrol to random points in the trigger zone ZONE, at 120 km/h in Vee format.
  Vehicle:PatrolZones( { ZONE:New( "ZONEVEHICLE" ) }, 120, "Vee" )
  
  -- Find the Vehicle and create a GROUP object.
  Ship = GROUP:FindByName( "Ship" )
  
  -- Patrol to random points in the trigger zone ZONE, at 120 km/h in Vee format.
  Ship:PatrolZones( { ZONE:New( "ZONESHIP" ) }, 120, "Vee" )
