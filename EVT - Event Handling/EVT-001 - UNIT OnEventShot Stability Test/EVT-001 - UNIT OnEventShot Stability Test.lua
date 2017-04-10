---
-- Name: EVT-001 - UNIT OnEventShot Stability Test
-- Author: FlightControl
-- Date Created: 9 Apr 2017
--
-- # Situation:
--
-- A couple of planes are firing to each other. Monitor the shot events.
-- I am doing a collectgarbage to test the stability of the event handling.
-- Also when the planes are destroyed, the event handling should stop etc.
-- The tests are on GROUP level.
-- 
-- # Test cases:
-- 
-- 1. Observe the planes shooting the missiles.
-- 2. Observe when the plane shoots the missile, a dcs.log entry is written in the logging.
-- 3. Check the stability of the event handlings.

PlaneGroupsBlue = {}

PlaneGroupsRed = {}

PlaneSpawnBlue = SPAWN
  :New( "Planes Blue" )
  :InitLimit( 2, 0 )
  :SpawnScheduled( 10,0 )
  :OnSpawnGroup(
    function( SpawnGroup )
      SpawnGroupName = SpawnGroup:GetName()
      PlaneGroupsBlue[SpawnGroupName] = SpawnGroup
      PlaneGroupsBlue[SpawnGroupName]:HandleEvent( EVENTS.Shot )
      PlaneGroupsBlue[SpawnGroupName]:HandleEvent( EVENTS.Hit )
      collectgarbage()
      PlaneGroupsBlue[SpawnGroupName].OnEventShot = function( self, EventData )
        self:F( EventData )
        self:MessageToAll( "I just fired a missile!", 15, "Alert!" )
      end
      PlaneGroupsBlue[SpawnGroupName].OnEventHit = function( self, EventData )
        self:F( EventData )
        self:MessageToAll( "I just got hit!", 15, "Alert!" )
      end
    end
    )

PlaneSpawnRed = SPAWN
  :New( "Planes Red" )
  :InitLimit( 2, 0 )
  :SpawnScheduled(10,0)
  :OnSpawnGroup(
    function( SpawnGroup )
      SpawnGroupName = SpawnGroup:GetName()
      PlaneGroupsRed[SpawnGroupName] = SpawnGroup
      PlaneGroupsRed[SpawnGroupName]:HandleEvent( EVENTS.Shot )
      PlaneGroupsRed[SpawnGroupName]:HandleEvent( EVENTS.Hit )
      collectgarbage()
      --- @param self
      -- @param Core.Event#EVENTDATA EventData
      PlaneGroupsRed[SpawnGroupName].OnEventShot = function ( self, EventData )
        self:F( EventData )
        
        self:MessageToAll( "I just got hit!", 15, "Alert!" )
      end
      PlaneGroupsRed[SpawnGroupName].OnEventHit = function( self, EventData )
        self:F( EventData )
        self:MessageToAll( "I just fired a missile!", 15, "Alert!" )
      end
    end
    )

collectgarbage()
BASE:E( "Collected garbage" )



