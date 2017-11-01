---
-- Name: CAZ-100 - Capture Zone
-- Author: FlightControl
-- Date Created: 11 Nov 2017
--

do -- Setup the Command Centers
  
  RU_CC = COMMANDCENTER:New( GROUP:FindByName( "REDHQ" ), "Russia HQ" )
  US_CC = COMMANDCENTER:New( GROUP:FindByName( "BLUEHQ" ), "USA HQ" )

end


AttackZone = ZONE:New( "AttackZone" )

ZoneCaptureCoalition = ZONE_CAPTURE_COALITION:New( AttackZone, coalition.side.RED )
ZoneCaptureCoalition:__Guard( 1 )
  

--- @param #ZoneCaptureCoalition self
function ZoneCaptureCoalition:OnEnterEmpty()
  self:Smoke( SMOKECOLOR.White )
end




--  local Coalition = self:GetCoalition()
--
--
--  self:E({Coalition = Coalition})
--  if Coalition == coalition.side.BLUE then
--    US_CC:MessageTypeToCoalition( string.format( "%s is under attack by Russia", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--    RU_CC:MessageTypeToCoalition( string.format( "We are attacking %s", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--  else
--    RU_CC:MessageTypeToCoalition( string.format( "%s is under attack by the USA", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--    US_CC:MessageTypeToCoalition( string.format( "We are attacking %s", ZoneCaptureCoalition:GetZoneName() ), MESSAGE.Type.Information )
--  end