--- This makes a vehicle drive its route selecting random points in a zone.
-- Name: GRP-552 - Patrol in a zone (one zone)
-- Author: FlightControl
-- Date Created: 24 Sep 2017

Vehicle = GROUP:FindByName( "Vehicle" )

Vehicle:PatrolZones( { ZONE:New( "ZONE" ) }, 120, "Vee" )
