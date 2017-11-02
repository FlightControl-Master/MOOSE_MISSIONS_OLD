---
-- Name: CAZ-101 - Capture Zone - Demo 1
-- Author: FlightControl
-- Date Created: 2 Nov 2017
--

do -- Setup the Command Centers
  
  RU_CC = COMMANDCENTER:New( GROUP:FindByName( "REDHQ" ), "Russia HQ" )
  US_CC = COMMANDCENTER:New( GROUP:FindByName( "BLUEHQ" ), "USA HQ" )

end


AttackZone = ZONE:New( "AttackZone" )

ZoneCaptureCoalition = ZONE_CAPTURE_COALITION:New( AttackZone, coalition.side.RED )
ZoneCaptureCoalition:__Guard( 1 )

HeliBlueSpawn = SPAWN:New( "Blue Helicopters" )
TankBlueSpawn = SPAWN:New( "Blue Tanks" )

HeliRedSpawn = SPAWN:New( "Red Helicopters" )
TankRedSpawn = SPAWN:New( "Red Tanks" )

-- @type ZoneCaptureCoalition
-- @extends Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION  

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function ZoneCaptureCoalition:OnEnterGuarded()
  local Coalition = self:GetCoalition()
  local ZoneName = ZoneCaptureCoalition:GetZoneName()
  if Coalition == coalition.side.BLUE then
    RU_CC:MessageTypeToCoalition( string.format( "The vicinity %s is still guarded, Enforcements are underway to capture the zone!", ZoneName ), MESSAGE.Type.Information )
    local AttackCoord = AttackZone:GetRandomCoordinate()
    local HeliRedGroup = HeliRedSpawn:Spawn()
    local HeliRedCoord = HeliRedGroup:GetCoordinate()
    local CurrentWaypoint = HeliRedCoord:WaypointAirTurningPoint( COORDINATE.WaypointAltType.RADIO, 150 )
    local ToWaypoint = AttackCoord:WaypointAirTurningPoint( COORDINATE.WaypointAltType.RADIO, 150 )
    HeliRedGroup:Route( { CurrentWaypoint, ToWaypoint }, 1 )
    HeliRedGroup:OptionROEWeaponFree()
    local TankRedGroup = TankRedSpawn:Spawn()
    TankRedGroup:RouteGroundTo( AttackCoord, math.random( 60, 80 ), "Vee", 1 )
  else
    US_CC:MessageTypeToCoalition( string.format( "The vicinity %s is still guarded, Enforcements are underway to capture the zone!", ZoneName ), MESSAGE.Type.Information )
    local AttackCoord = AttackZone:GetRandomCoordinate()
    local HeliBlueGroup = HeliBlueSpawn:Spawn()
    local HeliBlueCoord = HeliBlueGroup:GetCoordinate()
    local CurrentWaypoint = HeliBlueCoord:WaypointAirTurningPoint( COORDINATE.WaypointAltType.RADIO, 150 )
    local ToWaypoint = AttackCoord:WaypointAirTurningPoint( COORDINATE.WaypointAltType.RADIO, 150 )
    HeliBlueGroup:Route( { CurrentWaypoint, ToWaypoint }, 1 )
    HeliBlueGroup:OptionROEWeaponFree()
    local TankBlueGroup = TankBlueSpawn:Spawn()
    TankBlueGroup:RouteGroundTo( AttackCoord, math.random( 60, 80 ), "Vee", 1 )
  end
end


--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function ZoneCaptureCoalition:OnEnterEmpty()
  self:Flare( FLARECOLOR.White )
end

--- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function ZoneCaptureCoalition:OnEnterCaptured()
  local Coalition = self:GetCoalition()
  local ZoneName = ZoneCaptureCoalition:GetZoneName()
  if Coalition == coalition.side.BLUE then
    self:Smoke( SMOKECOLOR.Blue )
    RU_CC:MessageTypeToCoalition( string.format( "%s is captured by the USA, we lost it!", ZoneName ), MESSAGE.Type.Information )
    US_CC:MessageTypeToCoalition( string.format( "We captured %s, Excellent job!", ZoneName ), MESSAGE.Type.Information )
  else
    self:Smoke( SMOKECOLOR.Red )
    US_CC:MessageTypeToCoalition( string.format( "%s is captured by Russia, we lost it!", ZoneName ), MESSAGE.Type.Information )
    RU_CC:MessageTypeToCoalition( string.format( "We captured %s, Excellent job!", ZoneName ), MESSAGE.Type.Information )
  end
end



