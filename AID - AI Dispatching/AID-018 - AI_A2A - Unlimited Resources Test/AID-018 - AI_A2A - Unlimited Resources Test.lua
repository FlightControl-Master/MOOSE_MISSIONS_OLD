---
-- Name: AID-018 - AI_A2A - Unlimited Resources Test
-- Author: FlightControl
-- Date Created: 05 Aug 2017


-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "DF CCCP AWACS", "DF CCCP EWR" } )
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

-- Initialize the dispatcher, setting up a border zone. This is a polygon, 
-- which takes the waypoints of a late activated group with the name CCCP Border as the boundaries of the border area.
-- Any enemy crossing this border will be engaged.
CCCPBorderZone = ZONE_POLYGON:New( "CCCP Border", GROUP:FindByName( "CCCP Border" ) )
--A2ADispatcher:SetBorderZone( CCCPBorderZone )


A2ADispatcher:SetTacticalDisplay( true )

-- Setup the squadrons.
-- Unlimited resources, as the Resources parameter of the :SetSquadron method is not given.

A2ADispatcher:SetSquadron( "Sochi", AIRBASE.Caucasus.Sochi_Adler, { "SQ CCCP MIG-31" } )
A2ADispatcher:SetSquadronGci( "Sochi", 900, 1200 )
A2ADispatcher:SetSquadronTakeoffFromParkingCold( "Sochi" )

A2ADispatcher:SetSquadron( "Gelend", AIRBASE.Caucasus.Gelendzhik, { "SQ CCCP SU-27" } )
A2ADispatcher:SetSquadronGci( "Gelend", 800, 1200 )
A2ADispatcher:SetSquadronTakeoffFromRunway( "Gelend" )

A2ADispatcher:SetSquadron( "Anapa", AIRBASE.Caucasus.Anapa_Vityazevo, { "SQ CCCP SU-27" } )
A2ADispatcher:SetSquadronGci( "Anapa", 800, 1200 )
A2ADispatcher:SetSquadronTakeoffFromRunway( "Anapa" )

A2ADispatcher:SetSquadron( "Novo", AIRBASE.Caucasus.Novorossiysk, { "SQ CCCP SU-27" } )
A2ADispatcher:SetSquadronGci( "Novo", 800, 1200 )
A2ADispatcher:SetSquadronTakeoffFromRunway( "Novo" )

