
local FollowGroupSet = SET_GROUP:New():FilterCategories("plane"):FilterCoalitions("blue"):FilterPrefixes("Follow"):FilterStart()
FollowGroupSet:Flush()
local LeaderUnit = UNIT:FindByName( "Leader" )
local LargeFormation = AI_FORMATION:New( LeaderUnit, FollowGroupSet, "Trail Formation", "Briefing" )
LargeFormation:FormationBox(150,120,0,-5,0,60,8)
LargeFormation:__Start( 1 )

collectgarbage()

