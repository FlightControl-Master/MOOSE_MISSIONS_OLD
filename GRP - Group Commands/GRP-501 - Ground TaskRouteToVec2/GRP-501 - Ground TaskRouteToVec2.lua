-- This routes a GroundGroup 1km further with an angle of 180 degrees.

local GroundGroup = GROUP:FindByName( "Vehicle" )

-- Get the current coordinate of GroundGroup
FromCoord = GroundGroup:GetCoordinate()

-- From the current coordinate, calculate 1km away with an angle of 180 degrees.
ToCoord = FromCoord:Translate( 1000, 180 )


-- Create a combo task, that creates a route task to the RoutePoint
RouteTask = GroundGroup:TaskRouteToVec2( ToCoord:GetVec2() )

-- Set the task to be executed by the GroundGroup
GroundGroup:SetTask( RouteTask, 1 )