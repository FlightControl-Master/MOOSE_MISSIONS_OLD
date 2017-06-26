
local FollowGroupSet = SET_GROUP:New():FilterCategories("plane"):FilterCoalitions("blue"):FilterPrefixes("Follow"):FilterStart()
FollowGroupSet:Flush()
local LeaderUnit = UNIT:FindByName( "Leader" )
local LargeFormation = AI_FORMATION:New( LeaderUnit, FollowGroupSet, "Trail Formation", "Briefing" )
LargeFormation:FormationBox(250,300,0,25,0,350,6)
LargeFormation:__Start( 1 )

collectgarbage()

