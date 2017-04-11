---
-- Name: EVT-002 - UNIT OnEventLand ReSpawn Test
-- Author: FlightControl
-- Date Created: 9 Apr 2017
--
-- # Situation:
--
-- A couple of planes are taking off from an airbase.
-- When they land, they send out a message that they landed.
-- But! They are automatically respawned upon landing.
-- The 2nd time the same plane lands, they should send the message again!!!
-- 
-- # Test cases:
-- 
-- 1. Observe in the logging, that the event subscriptions are reset when the respawn happens!
-- 2. Observe the 2nd time the same plane lands, they should send the message again!!!
-- 3. Check the stability of the event handlings.

PlaneBlueSpawn = SPAWN
  :New( "PlaneBlue" )
  :InitLimit(2,0)
  :InitRepeatOnEngineShutDown()
  :SpawnScheduled(60,0)
  :OnSpawnGroup(
    --- @param Wrapper.Group#GROUP SpawnGroup
    function( SpawnGroup )
      SpawnGroup:HandleEvent( EVENTS.Land )
      --- @param self
      -- @param Core.Event#EVENTDATA EventData
      function SpawnGroup:OnEventLand(EventData)
        EventData.IniGroup:MessageToAll("Landed",15,"Land Event")
      end
    end
  )

collectgarbage()
BASE:E( "Collected garbage" )



