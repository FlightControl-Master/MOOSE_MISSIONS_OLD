---
-- Name: EVT-105 - UNIT OnEventPlayerEnterUnit Example
-- Author: FlightControl
-- Date Created: 15 Dec 2017
--
-- 2 planes and 2 tanks are located on and near the airport.
-- The test is about checking if S_EVENT_PLAYER_ENTER_UNIT is correctly working in DCS single player and multi player.
-- The test requires you to jump into the 2 planes and into the 2 tanks using CA.
-- Please execute the following scenarios in Single and Multi-Player:
--
-- 1. Test in Single Player:
--
-- First we need to get the mission running... To do this, do the following actions:
-- - At mission startup, once you get the slots, press the ESC key... The slot selection window will disappear.
-- - Then press the ESC key again, and in the window, select the menu option "Select Slot".
-- 
-- Next, we select the 2 planes...
-- - Select Plane 1 slot. Go to external view. Once you are in the SU-25T, an orange smoke and a message should appear.
-- - Select Plane 2 slot. Go to external view. Once you are in the SU-25T, a red smoke and a message should appear.
-- 
-- Next, we select the 2 tanks... Select the MAP view using F10, and: 
-- - Select the Tank 1 unit using the arrow. And then press RALT-J which should jump you into Tank 1. Go to external view. Once you are in the Tank, a blue smoke and a message should appear.
-- - Select the Tank 2 unit using the arrow. And then press RALT-J which should jump you into Tank 2. Go to external view. Once you are in the Tank, a green smoke and a message should appear.
--
--
-- 2. Test in Multi Player:
-- 
-- Run the mission on a server, and connect to the mission with a client...
--
-- On the client machine, we select the 2 planes...
-- - Select Plane 1 slot. Go to external view. Once you are in the SU-25T, an orange smoke and a message should appear.
-- - Select Plane 2 slot. Go to external view. Once you are in the SU-25T, a red smoke and a message should appear.
-- 
-- On the client machine, we select the 2 tanks... Select the MAP view using F10, and: 
-- - Select the Tank 1 unit using the arrow. And then press RALT-J which should jump you into Tank 1. Go to external view. Once you are in the Tank, a blue smoke and a message should appear.
-- - Select the Tank 2 unit using the arrow. And then press RALT-J which should jump you into Tank 2. Go to external view. Once you are in the Tank, a green smoke and a message should appear.
--
-- 
-- If all of this is working correctly, then the fix is correctly patched!



-- Create a variable PlaneHuman that holds a reference to UNIT object (created by moose at the beginning of the mission) with the name "Plane x".
Plane1 = CLIENT:FindByName( "Plane 1" )
Plane2 = CLIENT:FindByName( "Plane 2" )

-- Subscribe to the event. The event occurs when a player enters a slot.
Plane1:HandleEvent( EVENTS.PlayerEnterUnit )
Plane2:HandleEvent( EVENTS.PlayerEnterUnit )

-- Because the Plane object is subscribed to the PlayerEnterUnit event, the following method will be automatically
-- called when the event is happening!

--- @param self
-- @param Core.Event#EVENTDATA EventData
function Plane1:OnEventPlayerEnterUnit( EventData )

  -- Okay, the Human has entered the unit, now smoke at the x, z position.
  EventData.IniUnit:SmokeOrange()
  MESSAGE:NewType( "A human has entered Plane 1", MESSAGE.Type.Information ):ToAll()
end


--- @param self
-- @param Core.Event#EVENTDATA EventData
function Plane2:OnEventPlayerEnterUnit( EventData )

  -- Okay, the Human has entered the unit, now smoke at the x, z position.
  EventData.IniUnit:SmokeRed()
  MESSAGE:NewType( "A human has entered Plane 2", MESSAGE.Type.Information ):ToAll()
end





--- Now for the ground units
Tank1 = UNIT:FindByName( "Tank 1" )
Tank2 = UNIT:FindByName( "Tank 2" )

-- Subscribe to the event. The event occurs when a player enters a slot.
Tank1:HandleEvent( EVENTS.PlayerEnterUnit )
Tank2:HandleEvent( EVENTS.PlayerEnterUnit )


-- Because the Tank object is subscribed to the PlayerEnterUnit event, the following method will be automatically
-- called when the event is happening!

--- @param self
-- @param Core.Event#EVENTDATA EventData
function Tank1:OnEventPlayerEnterUnit( EventData )

  -- Okay, the Human has entered the unit, now smoke at the x, z position.
  EventData.IniUnit:SmokeBlue()
  MESSAGE:NewType( "A human has entered Tank 1", MESSAGE.Type.Information ):ToAll()
end


--- @param self
-- @param Core.Event#EVENTDATA EventData
function Tank2:OnEventPlayerEnterUnit( EventData )

  -- Okay, the Human has entered the unit, now smoke at the x, z position.
  EventData.IniUnit:SmokeGreen()
  MESSAGE:NewType( "A human has entered Tank 2", MESSAGE.Type.Information ):ToAll()
end

