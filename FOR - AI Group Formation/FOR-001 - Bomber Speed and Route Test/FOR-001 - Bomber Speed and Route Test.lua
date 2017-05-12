
local FollowGroupSet = SET_GROUP:New():FilterCategories("plane"):FilterCoalitions("blue"):FilterPrefixes("Follow"):FilterStart()
FollowGroupSet:Flush()
local LeaderUnit = UNIT:FindByName( "Leader" )
local LargeFormation = AI_FORMATION:New( LeaderUnit, FollowGroupSet, "Left Line Formation", "Briefing" ):TestSmokeDirectionVector(true)
LargeFormation:FormationLeftLine( 500, 0, 250, 0 )
LargeFormation:__Start( 1 )

