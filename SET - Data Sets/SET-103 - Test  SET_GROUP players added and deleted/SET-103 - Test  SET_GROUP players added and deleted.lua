---
-- Name: SET-103 - Test  SET_GROUP players added and deleted
-- Author: FlightControl
-- Date Created: 31 Mar 2017
--
-- # Situation:
-- 
-- Multiple groups of ground vehicles have been defined.
-- There are collected in a SET_GROUP.
-- A human player is jumping into the seat on one of these vehicles of the SET_GROUP.
-- 
-- # Test cases:
-- 
-- 1. Observe the player added and deleted from the SET_GROUP depending on the behaviour.


SetGroupObject = SET_GROUP:New():FilterCoalitions("blue"):FilterPrefixes("Group Object"):FilterStart()
