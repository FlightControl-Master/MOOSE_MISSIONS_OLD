-- Name: SPA-131 - Air Ops - SpawnAtAirbase
-- Author: FlightControl
-- Date Created: 14 Sep 2017
--
Spawn_Plane = SPAWN:New( "Plane" )
Spawn_Plane:SpawnAtAirbase( AIRBASE:FindByName( AIRBASE.Caucasus.Krymsk ), SPAWN.Takeoff.Cold )
Spawn_Plane:SpawnAtAirbase( AIRBASE:FindByName( AIRBASE.Caucasus.Krymsk ), SPAWN.Takeoff.Hot )
Spawn_Plane:SpawnAtAirbase( AIRBASE:FindByName( AIRBASE.Caucasus.Krymsk ), SPAWN.Takeoff.Runway )

Spawn_Plane:SpawnAtAirbase( AIRBASE:FindByName( "Carrier" ), SPAWN.Takeoff.Cold )

--Spawn_PlaneOnShip = SPAWN:New( "Plane On Ship" )
--Spawn_PlaneOnShip:Spawn()


