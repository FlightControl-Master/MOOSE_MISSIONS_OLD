---
-- Name: SET-102 - Test  SET_GROUP object against ZONE
-- Author: FlightControl
-- Date Created: 31 Mar 2017
--
-- # Situation:
-- 
-- A ZONE has been defined, and the SET_GROUP object is checked against the zone.
-- 
-- # Test cases:
-- 
-- 1. Observe the zone perimeter, and place the SET_GROUP object in or out of the zone.
-- 2. Observe the results of the functions.


SetGroupObject = SET_GROUP:New():FilterCoalitions("blue"):FilterPrefixes("Group Object"):FilterStart()

Zone = ZONE:New( "Zone" )

SetGroupObject:ForEachGroupCompletelyInZone( Zone,
  function( GroupObject )
    GroupObject:E( { GroupObject:GetName(), "I am completely in Zone" } )
  end )

SetGroupObject:ForEachGroupPartlyInZone( Zone,
  function( GroupObject )
    GroupObject:E( { GroupObject:GetName(), "I am partially in Zone" } )
  end )

SetGroupObject:ForEachGroupNotInZone( Zone,
  function( GroupObject )
    GroupObject:E( { GroupObject:GetName(), "I am not in Zone" } )
  end )

