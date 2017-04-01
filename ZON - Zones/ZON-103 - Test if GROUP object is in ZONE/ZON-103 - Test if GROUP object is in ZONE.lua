---
-- Name: ZON-103 - Test if GROUP object is in ZONE
-- Author: FlightControl
-- Date Created: 31 Mar 2017
--
-- # Situation:
-- 
-- A ZONE has been defined, and it is checked if a GROUP object is within the zone.
-- 
-- # Test cases:
-- 
-- 1. Observe the zone perimeter, and place the GROUP object in or out of the zone.
-- 2. Observe the results of the functions.


GroupObject = GROUP:FindByName( "Group Object" )

Zone = ZONE:New( "Zone" )


Zone:E( { "Group is completely in Zone:", GroupObject:IsCompletelyInZone( Zone ) } )
Zone:E( { "Group is partially in Zone:", GroupObject:IsPartlyInZone( Zone ) } )
Zone:E( { "Group is not in Zone:", GroupObject:IsNotInZone( Zone ) } )

