
local FollowGroupSet = SET_GROUP:New():FilterCategories("plane"):FilterCoalitions("blue"):FilterPrefixes("Follow"):FilterStart()
FollowGroupSet:Flush()
local LeaderUnit = UNIT:FindByName( "Leader" )
local LargeFormation = AI_FORMATION:New( LeaderUnit, FollowGroupSet, "Left Wing Formation", "Briefing" )
LargeFormation:FormationLeftWing( 500, 50, 0, 250, 250 )
LargeFormation:__Start( 1 )

