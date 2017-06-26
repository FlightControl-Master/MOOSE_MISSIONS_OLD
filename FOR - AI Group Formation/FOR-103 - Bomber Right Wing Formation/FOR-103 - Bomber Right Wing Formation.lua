
local FollowGroupSet = SET_GROUP:New():FilterCategories("plane"):FilterCoalitions("blue"):FilterPrefixes("Follow"):FilterStart()
FollowGroupSet:Flush()
local LeaderUnit = UNIT:FindByName( "Leader" )
local LargeFormation = AI_FORMATION:New( LeaderUnit, FollowGroupSet, "Right Wing Formation", "Briefing" )
LargeFormation:FormationRightWing( 100, 50, 0, 500, 500 )
LargeFormation:__Start( 1 )

