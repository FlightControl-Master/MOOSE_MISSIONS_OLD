---
-- Name: EVT-205 - GROUP OnEventDead Example
-- Author: FlightControl
-- Date Created: 29 May 2017
--
-- # Situation:
--
-- Two groups of planes are flying in the air and shoot an missile to a multitude of ground targets.
-- 
-- # Test cases:
-- 
-- 1. Observe the planes shooting the missile.
-- 2. Observe when the planes shoots the missile, and hit the group Tanks A, a dcs.log entry is written in the logging.
-- 3. Check the contents of the fields of the S_EVENT_HIT entry.
-- 4. The tanks of GROUP "Group Tanks A", should only send a message when they get hit.
-- 5. The tanks of GROUP "Group Tanks B", should NOT send a message when they get hit.

TanksGroup = GROUP:FindByName( "Group Tanks A" )

TanksGroup:HandleEvent( EVENTS.Dead )

function TanksGroup:OnEventDead( EventData )

  self:E( "I just got dead and I am part of " .. EventData.IniGroupName )
  EventData.IniUnit:MessageToAll( "I just got dead and I am part of " .. EventData.IniGroupName, 15, "Alert!" )
end


