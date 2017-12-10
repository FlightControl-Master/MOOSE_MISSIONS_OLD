--- 
-- Name: GRP-900 - Option Green and Red State
-- Author: FlightControl
-- Date Created: 10 Dec 2017
--
-- This tests the option to set the alarm state of a group to RED or GREEN.
-- Both options are tested with two groups.
-- Please check the dcs.log in case of errors, and the time the group reacts to the approaching target.
-- The Red State Group should react much faster than the Green State Group.
-- 
-- Join the Game Master to observe the reaction of the ground units.
-- 
-- Blue is attacking.
-- Green is defending.
-- 


RedStateGroup = GROUP:FindByName( "Red State" )
GreenStateGroup = GROUP:FindByName( "Green State" )


RedStateGroup:OptionAlarmStateRed()
GreenStateGroup:OptionAlarmStateGreen()




