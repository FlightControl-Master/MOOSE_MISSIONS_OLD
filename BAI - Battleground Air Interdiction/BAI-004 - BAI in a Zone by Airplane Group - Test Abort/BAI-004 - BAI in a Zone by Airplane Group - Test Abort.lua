---
-- Name: BAI-004 - BAI in a Zone by Airplane Group - Test Abort
-- Author: FlightControl
-- Date Created: 09 May 2017
--
-- # Situation:
--
-- A group of 4 bombers at patrolling north of an engage zone for 1 minute.
-- After 10 minutes, the command center orders the bombers to engage the zone and execute a BAI.
-- After 12 minutes, the mission is aborted.
--
-- # Test cases:
-- 
-- 1. Observe that the bombers is patrolling in the patrol zone, until the engage command is given.
-- 2. The bombers are not detecting any target during the patrol.
-- 3. When the bombers is commanded to engage, the group will fly to the engage zone
-- 3.1. The approach speed to the engage zone is set to 350 km/h.
-- 3.2. The altitude to the engage zone and BAI execution is set to 4000 meters.
-- 4. Observe the mission being aborted. A message will be sent.
-- 5. The bombers will go back patrolling.



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

-- After 10 minutes, tell the group BAIPlane to engage the targets located in the engagement zone called BAIEngagement Zone. (600 is 600 seconds) 
AIBAIZone:__Engage( 600, 350, 4000 ) -- Engage after 10 minutes with a speed of 350 km/h and an altitude of 4000 meters.

-- After 12 minutes, tell the group BAIPlane to abort the engagement. 
AIBAIZone:__Abort( 720 ) -- Abort the engagement.

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

function AIBAIZone:OnAfterAbort(Controllable,From,Event,To)
  BASE:E( "MISSION ABORT! Back to patrol zone." )
  MESSAGE:New("Mission ABORTED! Back to the Patrol Zone!",30,"ALERT!"):ToAll()  
end

-- When the targets in the zone are destroyed, (see scheduled function), the planes will return home ...
function AIBAIZone:OnAfterAccomplish( Controllable, From, Event, To )
  BASE:E( "Test Mission: Sending the bombers back to base." )
  Check:Stop( CheckScheduleID )
  AIBAIZone:__RTB( 1 )
end
