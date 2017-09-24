--- This makes a vehicle drive its route selecting random points in a zone.
-- Name: GRP-553 - Patrol in a list of zones
-- Author: FlightControl
-- Date Created: 24 Sep 2017

Vehicle = GROUP:FindByName( "Vehicle" )

Vehicle:PatrolZones( { ZONE:New( "ZONE1" ), ZONE:New( "ZONE2" ), ZONE:New( "ZONE3" ) }, 120, "Vee" )
