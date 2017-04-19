--- Name: SPS-100 - Simple Spawning
-- Author: FlightControl
-- Date Created: 09 Apr 2017
--
-- # Situation:
--
-- At Gudauta spawn a static.
-- 
-- # Test cases:
-- 
-- 1. Observe that the static is spawned.


local ZonePosition = ZONE:New( "Position" )

local SpawnBuilding = SPAWNSTATIC:NewFromStatic( "Building", country.id.GERMANY )
local SpawnBarrack = SPAWNSTATIC:NewFromStatic( "Barrack", country.id.GERMANY )

local ZonePointVec2 = ZonePosition:GetPointVec2()

local Building = SpawnBuilding:SpawnFromZone( ZonePosition, 0 )

for Heading = 0, 360,60 do
  local Radial = Heading * ( math.pi*2 ) / 360
  local x = ZonePointVec2:GetLat() + math.cos( Radial ) * 150
  local y = ZonePointVec2:GetLon() + math.sin( Radial ) * 150
  SpawnBarrack:SpawnFromPointVec2( POINT_VEC2:New( x, y ), Heading + 90 )
end



