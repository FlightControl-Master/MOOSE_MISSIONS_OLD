---
-- Name: EVT-402 - Generic OnEventMissionEnd Example
-- Author: FlightControl
-- Date Created: 12 Apr 2017
--
-- # Situation:
--
-- Test mission end event handler.
-- 
-- # Test cases:
-- 
-- 1. Observe when the mission ends, a dcs.log entry is written in the logging.
-- 2. The generic EventHandler objects should be called, and a log entry in dcs.log should be written.

CC = COMMANDCENTER:New( UNIT:FindByName( "HQ" ), "HQ" )

EventHandler = EVENTHANDLER:New()

EventHandler:HandleEvent( EVENTS.MissionEnd )

function EventHandler:OnEventMissionEnd( EventData )
  self:E("Mission End")
end



