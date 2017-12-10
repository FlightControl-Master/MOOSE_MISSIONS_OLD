-- Name: SPA-027 - Ground Ops - Respawning After Destroy
-- Author: FlightControl
-- Date Created: 10 Dec 2017
--
-- At Gudauta spawns ground vehicle, in a scheduled fashion.
-- There can only be a maximum of 2 grond vehicles alive.
-- When a ground vehicle is destroyed, a new one needs to be spawned at a different location in the zone.
-- Until that one is also destroyed.
-- 
-- Red is attacking the spawned blue vehicles.
-- Once blue is destroyed, a new blue needs to spawn.
-- Until all 10 blue vehicles are spawned.
-- The position of blue is randomized in the zone.
-- Blue has ROE hold weapons.
-- 


BlueVehicleSpawn = SPAWN
  :New( "Tank" )
  :InitLimit( 2, 10 )
  :InitRandomizePosition( true, 200, 50 )
  :SpawnScheduled( 5, .5 )



