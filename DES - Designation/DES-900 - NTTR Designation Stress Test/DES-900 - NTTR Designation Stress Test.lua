---
-- Name: DES - Designation/DES-900 - NTTR Designation Stress Test
-- Author: FlightControl
-- Date Created: 10 Aug 2017
--


HQ = GROUP:FindByName( "HQ" )
CC = COMMANDCENTER:New( HQ, "HQ" )

M1 = MISSION:New(CC,"Test","High","Briefing",coalition.side.BLUE)

FAC = SET_GROUP:New():FilterPrefixes( "FAC" ):FilterStart()
Detection = DETECTION_AREAS:New( FAC, 750 )

AttackA10C = SET_GROUP:New():FilterPrefixes( "Attack A10C" ):FilterStart()
AttackSU25T = SET_GROUP:New():FilterPrefixes( "Attack SU25T" ):FilterStart()

Designate = DESIGNATE:New( CC, Detection, AttackA10C, M1)
Designate:SetThreatLevelPrioritization( true )
Designate:GenerateLaserCodes()

Designate = DESIGNATE:New( CC, Detection, AttackSU25T, M1)
Designate:SetThreatLevelPrioritization( false )
Designate:SetLaserCodes( "1113" )


