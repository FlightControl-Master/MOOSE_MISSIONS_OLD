



Clean = CLEANUP_AIRBASE:New( AIRBASE.Caucasus.Batumi )
Clean:SetCleanMissiles( false )


SpawnRU = SPAWN:New( 'RU Attack Heli Batumi'):InitLimit( 2, 120 ):SpawnScheduled( 10, 0 )

SpawnUS = SPAWN:New( 'US Attack Heli Batumi'):InitLimit( 2, 120 ):SpawnScheduled( 10, 0 )

SpawnTransport = SPAWN:New( "US Transport"):SpawnScheduled( 90, 0 )

