---
-- Name: BAI-005 - BAI in a Zone by Airplane Group - Engage with WeaponExpend
-- Author: FlightControl
-- Date Created: 09 May 2017
--
-- # Situation:
--
-- A group of 4 bombers at patrolling north of an engage zone for 1 minute.
-- After 1 minute, the command center orders the bombers to engage the zone and execute a BAI.
-- The planes should expend 4 weapons per run.
--
-- # Test cases:
-- 
-- 1. Observe that the bombers is patrolling in the patrol zone, until the engage command is given.
-- 2. The bombers are not detecting any target during the patrol.
-- 3. When the bombers is commanded to engage, the group will fly to the engage zone
-- 3.1. The approach speed to the engage zone is set to 400 km/h.
-- 3.2. The altitude to the engage zone and BAI execution is set to 500 meters.
-- 3.3. The planes should expend 4 weapons per run.
-- 4. Detection is activated and detected targets within the engage zone are assigned for BAI.
-- 5. Observe the bombers eliminating the targets.
-- 6. Observe the bombers defenses.
-- 7. When all targets within the engage zone are destroyed, the bombers BAI task is set to Accomplished.
-- 8. The bombers will return to base.



-- Create a local variable (in this case called BAIEngagementZone) and 
-- using the ZONE function find the pre-defined zone called "Engagement Zone" 
-- currently on the map and assign it to this variable
BAIEngagementZone = ZONE:New( "Engagement Zone" )

-- Create a local variable (in this case called BAIPlane) and 
-- using the GROUP function find the aircraft group called "Plane" and assign to this variable
BAIPlane = GROUP:FindByName( "Plane" )

-- Create a local Variable (in this cased called PatrolZone and 
-- using the ZONE function find the pre-defined zone called "Patrol Zone" and assign it to this variable
PatrolZone = ZONE:New( "Patrol Zone" )

-- Create and object (in this case called AIBAIZone) and 
-- using the functions AI_BAI_ZONE assign the parameters that define this object 
-- (in this case PatrolZone, 500, 1000, 500, 600, BAIEngagementZone) 
AIBAIZone = AI_BAI_ZONE:New( PatrolZone, 500, 1000, 500, 600, BAIEngagementZone )

-- Create an object (in this case called Targets) and 
-- using the GROUP function find the group labeled "Targets" and assign it to this object
Targets = GROUP:FindByName("Targets")


-- Tell the program to use the object (in this case called BAIPlane) as the group to use in the BAI function
AIBAIZone:SetControllable( BAIPlane )

-- Tell the group BAIPlane to start the mission in 1 second. 
AIBAIZone:__Start( 1 ) -- They should statup, and start patrolling in the PatrolZone.

-- After 1 minute, tell the group BAIPlane to engage the targets located in the engagement zone called BAIEngagement Zone. (600 is 600 seconds) 
AIBAIZone:__Engage( 60, 600, 8000, AI.Task.WeaponExpend.FOUR ) -- Engage with a speed of 600 km/h and an altitude of 8000 meters, weapn expend 4.

-- Check every 60 seconds whether the Targets have been eliminated.
-- When the trigger completed has been fired, the Plane will go back to the Patrol Zone.
Check, CheckScheduleID = SCHEDULER:New(nil,
  function()
    if Targets:IsAlive() and Targets:GetSize() > 5 then
      BASE:E( "Test Mission: " .. Targets:GetSize() .. " targets left to be destroyed.")
    else
      BASE:E( "Test Mission: The required targets are destroyed." )
      AIBAIZone:__Accomplish( 1 ) -- Now they should fly back to teh patrolzone and patrol.
    end
  end, {}, 20, 60, 0.2 )


-- When the targets in the zone are destroyed, (see scheduled function), the planes will return home ...
function AIBAIZone:OnAfterAccomplish( Controllable, From, Event, To )
  BASE:E( "Test Mission: Sending the bombers back to base." )
  Check:Stop( CheckScheduleID )
  AIBAIZone:__RTB( 1 )
end
