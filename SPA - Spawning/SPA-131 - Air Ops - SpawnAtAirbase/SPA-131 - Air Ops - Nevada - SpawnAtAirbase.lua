-- Name: SPA-131 - Air Ops - SpawnAtAirbase
-- Author: FlightControl
-- Date Created: 14 Sep 2017
--
Spawn_Plane = SPAWN:New( "Plane" )
Spawn_Plane:SpawnAtAirbase( AIRBASE:FindByName( AIRBASE.Nevada.Groom_Lake_AFB ), SPAWN.Takeoff.Cold )
Spawn_Plane:SpawnAtAirbase( AIRBASE:FindByName( AIRBASE.Nevada.Groom_Lake_AFB ), SPAWN.Takeoff.Hot )
Spawn_Plane:SpawnAtAirbase( AIRBASE:FindByName( AIRBASE.Nevada.Groom_Lake_AFB ), SPAWN.Takeoff.Runway )



