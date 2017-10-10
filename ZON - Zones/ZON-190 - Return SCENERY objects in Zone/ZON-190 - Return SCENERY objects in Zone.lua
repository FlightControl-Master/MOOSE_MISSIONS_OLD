---
-- Name: ZON-190 - Return SCENERY objects in Zone
-- Author: FlightControl
-- Date Created: 08 Oct 2017
--
-- # Situation:
-- 
-- # Test cases:
-- 


Zone = ZONE:New( "Zone" )


Zone:Scan( Object.Category.SCENERY )

for SceneryTypeName, SceneryData in pairs( Zone:GetScannedScenery() ) do
  for SceneryName, SceneryObject in pairs( SceneryData ) do
    local SceneryObject = SceneryObject -- Wrapper.Scenery#SCENERY
    MESSAGE:NewType( "Scenery: " .. SceneryObject:GetTypeName() .. ", Coord LL DMS: " .. SceneryObject:GetCoordinate():ToStringLLDMS(), MESSAGE.Type.Information ):ToAll()
  end
end