
local FollowGroupSet = SET_GROUP:New():FilterCategories("plane"):FilterCoalitions("blue"):FilterPrefixes("Follow"):FilterStart()
FollowGroupSet:Flush()
local LeaderUnit = UNIT:FindByName( "Leader" )
local LargeFormation = AI_FORMATION:New( LeaderUnit, FollowGroupSet, "Left Line Formation", "Briefing" )
LargeFormation:FormationLeftLine( 0, 0, 250, 250 )
LargeFormation:__Start( 1 )

