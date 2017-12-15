-- Name: TAD-130 - A2G - Dynamic Spawning and Detection
-- Author: FlightControl
-- Date Created: 04 Nov 2017
--
-- This mission demonstrates the dynamic task dispatching for Air to Ground operations.
-- FACA's and FAC's are patrolling around the battle zone, while detecting targets.
-- The detection method used is the DETECTION_AREAS method, which groups detected targets into zones.
-- 1. Observe the FAC(A)'s detecting targets and grouping them. 
-- 2. Check that the HQ provides menus to engage on a task set by the FACs.


 
HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

CommandCenter = COMMANDCENTER:New( HQ, "Lima" )

Scoring = SCORING:New( "A2G Dispatching Demo" )

Mission = MISSION
  :New( CommandCenter, "Overlord", "High", "Select to spawn a new target from the menu to test A2G module", coalition.side.RED )
  :AddScoring( Scoring )

FACSet = SET_GROUP:New():FilterPrefixes( "Fac" ):FilterCoalitions("red"):FilterStart()

FACAreas = DETECTION_AREAS:New( FACSet, 50 )
--FACAreas:BoundDetectedZones()

AttackGroups = SET_GROUP:New():FilterCoalitions( "red" ):FilterPrefixes( "Attack" ):FilterStart()

TaskDispatcher = TASK_A2G_DISPATCHER:New( Mission, AttackGroups, FACAreas )


MissileTrainer = MISSILETRAINER:New( 100, "Missiles will be destroyed for training when they reach your plane." )


-- Spawn dynamically new targets using a menu option.

-- Setup the Spawn object to spawn the SpawnTemplateSet at random positions in a polygon zone "SpawnZone".
SpawnZone = ZONE_POLYGON:New( "SpawnZone", GROUP:FindByName( "SpawnZone") )
SpawnGroups = SPAWN:New( "Spawn" )
SpawnGroups:InitRandomizeTemplate( { 
    "Spawn Ground Template #001",
    "Spawn Ground Template #002",
    "Spawn Ground Template #003",
    "Spawn Ground Template #004",
    "Spawn Ground Template #005" }
  )
SpawnGroups:InitRandomizeZones( { SpawnZone } )

local function SpawnNewObject()
  SpawnGroups:Spawn()
end

MenuSpawn = MENU_COALITION_COMMAND:New( coalition.side.RED, "Spawn new target", nil, SpawnNewObject )


