---
-- Name: AID-901 - Nevada AI_A2A_DISPATCHER Template
-- Author: FlightControl
-- Date Created: 19 Jun 2017


---  A/ TEMPLATE USAGE
--   -----------------
-- 
--   This template models a necessary code fragments to setup a complete AI_A2A_DISPATCHER object,
--   which will automate the defenses for one coalition.
--   The template is made available to help mission designers withough any coding background, 
--   to be able to setup a working AI_A2A_DISPATCHER defense system!
--   
--   There is additional documentation online , that can be found here:
--   
--        http://flightcontrol-master.github.io/MOOSE/Documentation/AI_A2A_Dispatcher.html


---  B/ HOW TO READ
--   --------------
--
--   A few things to help you understand lua code, when you don't have a programming background.
--   You will be asked to cut / paste lines of code into this template, and fill in the blanks.
--   
--   PLEASE by all means skip to C, if you don't need to go through this, or this would be a waste of time.
--
--     1. Comments: 
--        A commented line is a code line that starts with two or three minuses (--)
--        A code line does not have -- in front so this code will be executed by your script when you run the logic.
--        You can comment lua code by adding a -- in front of the code line.
--        You can uncomment lua code by removing the -- in front of the code line.
--        A comment can also be place anywhere within your script, also after a valid code line.
--        For example: 
--            A = 5 -- This assigns 5 to A.
--            -- A = 5 -- This is a commented line. Won't be executed.
--         
--     2. Assignment:
--        If you see an '=' sign, that means an assignment. 
--        The left argument of the '=' sign, contains the result of the right argument after execution of that assignment.
--        We can the left argument the Variable.
--        The left argument can contain values, strings, arrays, ... calculations.
--
--     3. Objects:
--        Within MOOSE, the left argument can also contain an Object of a class, or "instance" of a class!
--        Consider an Object as a copy of the class, that contains values and methods that you can use to script your logic.
--        
--     4. Object Names: 
--        A default Object Name is given in the script template, but you can change the Object Name to your preferences!
--        If you do, please ensure that your new Object name is then consistently renamed within each lua statement.
--        For example: 
--          If your object name in the script template looks like:
--            BorderZone = ZONE:New( "Border Zone" )
--          You can change it to:
--            RedBorderZone = ZONE:New( "Border Zone" ) -- This sets a BorderZone for the RED coalition.
--
--     5. Object Methods: 
--        The Object can then be used to call its Methods. 
--        These are known functions by the Object, and will manipulate values or execute actions of the Object.
--        The Object:Method( ) syntax is a call to the Method ( = function ) of the Object.
--
--     6. CLASS Constructor Methods: 
--        The :New method is a special Method. 
--        The :New method is called the "Constructor method" of a CLASS, and copies the CLASS to a new object or instance of that class.
--        For example:
--            A2ADispatcher = AI_A2A_DISPATCHER:New( EWRNetwork, 20000 )
--          This copies the class AI_A2A_DISPATCHER definition, taking the initialization parameters EWRNEtwork and 20000, and creates a new Object of type AI_A2A_DISPATCHER.
--          After this statement, you can use A2ADispatcher methods to manipulate or execute actions of this Object!!! Isn't that great?
--
--     7. Method arguments: 
--        Anything between ( ) of the Method are called Arguments. 
--        Multiple arguments are separated by commas.
--        For example:
--            Object:Method( Argument1, Argument2 )
--          Argument1 and Argument2 can be of any type (value, string, array, object), and are separated by commas.
--
--
--     8. Anything between "" is called a string. 
--        These are text fields that you can change and are used to put the link between the mission editor and your mission script.
--        For example:
--          "Hello" -- This is a text or string containing "Hello".
--          Text = "Hello" -- this is an assignment of the text or string containing "Hello" and stored the result in the variable Text.
--
--     9. Anything between { } is called an array. 
--        Arrays are basically lists of values, strings, arrays, objects.
--        The array can have multiple values, and are separated by a comma.
--        For example:
--          { "Hello", "World" } -- This is an array of 2 string values, containing in the first element "Hello", and in the second element "World".



---  C/ SETUP the EWR NETWORK FOR A COALITION
--   ----------------------------------------
--   
--   The key driver for the AI_A2A_DISPATCHER is the detection done for a coalition through an EWR network.
--   This section builds a SET object that contains a collection of groups that defines the EWR network for a coalition.
--   
--   Here we build the network with all the groups that have a name starting with a "prefix", which is a part of a group name.
--   So MOOSE will scan all the groups defined within your mission, and will build a collection of groups starting with the prefix that you define.
--   Those will be stored in the object DetectionSetGroup.

---  Here the DetectionSetGroup object is created. Leave this untouched.

DetectionSetGroup = SET_GROUP:New()

---  The following line will create an EWR network collection of groups based on the group name start that you specify.
--   If you have multiple group prefixes, separate with a comma. Example: DetectionSetGroup:FilterPrefixes( { "Prefix1", "Prefix2" } ) 

DetectionSetGroup:FilterPrefixes( { "Prefix" } ) -- Change Prefix with the start of the group names that you will use to build the collection of the EWR network.

---  Here the DetectionSetGroup will start scanning your mission for groups with a name starting with the prefixes as specified above.

DetectionSetGroup:FilterStart()



---  D/ CREATE THE AI_A2A_DISPATCHER OBJECT (A2ADispatcher)
--   ------------------------------------------------------
-- 
--   The New method of AI_A2A_DISPATCHER creates a new AI_A2A_DISPATCHER object (a copy) and stores this as a reference in A2ADispatcher.
--   So here the A2ADispatcher is created for the coalition.
--   The DetectionSetGroup is given as the first parameter of AI_A2A_DISPATCHER:New method.
--   The 30000 (meters) is the second parameter to the New method, and defines the radius wherein detected targets will be grouped.
--   So anything within 30km will be grouped as a "target" detected.
--   You can change the 30000 to a smaller or larger value. But just beware that the larger the radius, the less targets areas, but the more targets will be reported within one area!
--   If the range is too small, there is a change that a lot of areas will be created with one or two targets in it.
--   The latter will result in more than proportional defense planes being spawned by your coalition!

A2ADispatcher = AI_A2A_DISPATCHER:New( DetectionSetGroup, 30000 )

---  If you want, you can enable the tactical display panel.
--   This will display every 30 seconds a text on what each group within your defense system is doing.
--   ACTIONS:
--     1. If you want the tactical display panel to be shown, delete the two "-- " in front of the underlying lua statement.

-- A2ADispatcher:SetTacticalDisplay( true )


---  E/ SETUP THE BORDER ZONE
--   ------------------------
-- 
--   If you want, you can create a border zone. 
--     1. If no border is required, then a hot war situation will be simulated. In this case, you can immediately skip to SECION D!
--     2. If a border zone is required, then a cold ware situation will be simulated.
--   One can use many different types of zones, but for convienience, a polygon zone is setup here.
--   which takes the waypoints of a late activated group with the name "Border Zone Gruop Name" as the boundaries of the border area.
--   Any enemy crossing this border will be engaged.
-- 
--   ACTIONS:
--     1. If you don't want to setup a border, SKIP to SECTION D!
--     2. Specify the "Border Name". This can be any name.
--     3. Specify the "Border Zone Group Name". This HAS TO BE the group name of the helicopter that is late activated as defined within the Mission Editor, defining the border zone by its waypoints!
--     4. If you want, you can rename the BorderZone object name to something else.

BorderZone = ZONE_POLYGON:New( "Border Name", GROUP:FindByName( "Border Zone Group Name" ) )

---  This sets the border zone BorderZone object to to the A2ADispatcher object using the method :SetBorderZone(). 

A2ADispatcher:SetBorderZone( { BorderZone } )


---  F/ SET THE ENGAGE RADIUS
--   ------------------------
--  
--   The engage radius is the range in meters that is used to collect the airborne friendlies within the engage range around a detected target, to be engaged.
--   Note that the engage radius must be carefully defined. 
--   If the engage radius is too large, then planes which are too far, may not reach the detected target in time!
--   If the engage radius is too small, then no airborne friendlies may be commanded to engage a detected target, and a GCI flight will be started from an airbase.
--   In the template, an enage radius of 100km is defined by default. However, if you're designing a WWII scenario, it is recommended to use 50000 km as the engage radius!
--   
--   ACTIONS:
--     1. Set the engage radius to a recommended size depending on airplane types, map size, CAP locations, enemies expected, airbase locations etc.

A2ADispatcher:SetEngageRadius( 100000 )


---  G/ DEFINE THE SQUADRONS
--   -----------------------
-- 
--   Okay, squadrons ...
--   Squadrons are define for EACH AIRBASE. An airbase can have one or MULTIPLE squadrons located.
--   
--   A squadron defines:
--     1. The name of the squadron, which is a name of your choice, but also acts as the key to identify the squadron. So the squadron name is used further throughout your script! Each squadron can be configured with several addtional options.
--     2. The airbase where your squadron is located.
--     3. As defined within the mission editor, the airplane late activated "template" group name, which is provided as an array of strings. Multiple group names can be given. Each group template may only have ONE airplane!
--     4. A number that defines the amount of units available to the squadron.
--   
--   A new Squadron is setup using the :SetSquadron() method, and takes the 4 above parameters.
--   Find below a list of A2ADispatcher:SetSquadron() method calls for each airbase in Nevada.
-- 
--   ACTION:
--     1. Select which airbases you want to position a squadron in.
--     2. Uncomment the relevant code lines that call A2ADispatcher:SetSquadron(), and the airbase is specified as the second parameter.
--     3. Ensure that any airbase that you don't want to use, is commented.
--     4. For each Squadron:
--       4.1. define the Squadron Name
--       4.2. keep the AIRBASE
--       4.3. link the Group Template Name with the group object as defined within the mission editor. Multiple Group Template Names can be given, separate them by a comma, for example "Name1", "Name2", "Name3".
--       4.4. specify amount of resources. 20 is given as a default value.

A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Anapa_Vityazevo, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Batumi, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Beslan, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Gelendzhik, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Gudauta, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Kobuleti, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Krasnodar_Center, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Krasnodar_Pashkovsky, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Krymsk, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Kutaisi, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Maykop_Khanskaya, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Mineralnye_Vody, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Mozdok, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Nalchik, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Novorossiysk, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Senaki_Kolkhi, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Sochi_Adler, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Soganlug, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Sukhumi_Babushara, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Tbilisi_Lochini, { "Group Template Name" }, 20 )
A2ADispatcher:SetSquadron( "Squadron Name", AIRBASE.Caucasus.Vaziani, { "Group Template Name" }, 20 )


---  F/ FOR EACH SQUADRON YOU MAY DEFINE THE OVERHEAD
--   ------------------------------------------------
-- 
--   Overhead is the amount of Units that dispatching command will allocate to intercept in surplus of detected amount of units.
--   The default overhead is 1, so equal balance. The :SetOverhead() method can be used to tweak the defense strength,
--   taking into account the plane types of the squadron. For example, a MIG-31 with full long-distance A2A missiles payload, may still be less effective than a F-15C with short missiles...
--   So in this case, one may want to use the Overhead method to allocate more defending planes as the amount of detected attacking planes.
--   The overhead must be given as a decimal value with 1 as the neutral value, which means that Overhead values: 
--     * Higher than 1, will increase the defense unit amounts.
--     * Lower than 1, will decrease the defense unit amounts.
-- 
--   The amount of defending units is calculated by multiplying the amount of detected attacking planes as part of the detected group 
--   multiplied by the Overhead and rounded up to the smallest integer. 
--   The Overhead value set for a Squadron, can be programmatically adjusted (by using this SetOverhead method), to adjust the defense overhead during mission execution.
-- 
--   Example:
--    1. An overhead of 1,5 with 1 planes detected, will allocate 2 planes ( 1 * 1,5 ) = 1,5 => rounded up gives 2.
--    2. An overhead of 1,5 with 2 planes detected, will allocate 3 planes ( 2 * 1,5 ) = 3 =>  rounded up gives 3.
--    3. An overhead of 1,5 with 3 planes detected, will allocate 5 planes ( 3 * 1,5 ) = 4,5 => rounded up gives 5 planes.
--    4. An overhead of 1,5 with 4 planes detected, will allocate 6 planes ( 4 * 1,5 ) = 6  => rounded up gives 6 planes.

A2ADispatcher:SetSquadronOverhead( "Squadron Name", 0.75 )

A2ADispatcher:SetSquadronOverhead( "Squadron Name", 1 ) -- This will create a balanced defense system. For each detected target, one defender will be mobilized.
A2ADispatcher:SetSquadronOverhead( "Squadron Name", 1.25 ) -- This will create an overhead when 2 or more units are detected.
A2ADispatcher:SetSquadronOverhead( "Squadron Name", 1,5 ) -- This creates more overhead.



---  G/ FOR EACH SQUADRON, YOU MAY DEFINE THE GROUPING OF RESOURCES
--   --------------------------------------------------------------
--  
--   Squadron Grouping defines how airplanes are grouped when performing CAP or GCI.
--   The method :SetSquadronGrouping takes two parameters:
--     1. The Squadron Name
--     2. The Grouping, which is a number between 1 and 4.
--   
--   The following Grouping parameter values have the following effect:
--   
--     - A Grouping of 1, will launch for each detected target in a target area a Defender Group of 1 airplane.
--     
--     - A Grouping of 2, will launch for each detected target in a target area Defender Groups of:
--       * If the target area contains only 1 target, then the Defender Group will contain one airplane.
--       * If the target area contains 2 targets, then the Defender Group will contain two airplanes.
--       * If the target area contains 3 targets, then 2 Defender Groups will be launched in GCI, one with 2 airplanes and one with 1 airplane.
--       * ...
--     
--     - A Grouping of 3, will launch for each detected target in a target area Defender Groups of:
--       * If the target area contains only 1 target, then one Defender Group will be launched, containing one airplane.
--       * If the target area contains 2 targets, then one Defender Group will be launched containing contain two airplanes.
--       * If the target area contains 3 targets, then one Defender Group will be launched containing 3 airplanes.
--       * If the target area contains 4 targets, then two Defender Groups will be launched, one containing 3 airplanes and one containing one airplane.
--       * ...
--       
--     - A Grouping of 4, will launch for each detected target in a target area Defender Groups of:
--       * If the target area contains only 1 target, then one Defender Group will be launched, containing one airplane.
--       * If the target area contains 2 targets, then one Defender Group will be launched containing contain two airplanes.
--       * If the target area contains 3 targets, then one Defender Group will be launched containing 3 airplanes.
--       * If the target area contains 4 targets, then one Defender Group will be launched containing 4 airplanes.
--       * If the target area contains 5 targets, then two Defender Groups will be launched, one containing 4 airplanes and one containing one airplane.
--       * ...
--       
--     ACTION:
--       1. For each Squadron that you would like to change the default grouping (which is 1), use the :SetSquadronGrouping method to set the new Grouping.
--       2. As the first parameter, specify the Squadron Name.
--       3. As the second parameter, specify the Grouping level, a number between 1 and 4.

A2ADispatcher:SetSquadronGrouping( "Squadron Name", 1 ) -- A grouping of 1
A2ADispatcher:SetSquadronGrouping( "Squadron Name", 2 ) -- A grouping of 2
A2ADispatcher:SetSquadronGrouping( "Squadron Name", 3 ) -- A grouping of 3
A2ADispatcher:SetSquadronGrouping( "Squadron Name", 4 ) -- A grouping of 4


---  H/ FOR EACH SQUADRON, YOU CAN CHANGE THE TAKEOFF METHOD TO OPTIMIZE AIRBASE EFFICIENCY
--   --------------------------------------------------------------------------------------
--
--   The Takeoff methods define for a Squadron the method at which new flights will spawn and take-off as part of the defense system from the airbase.
--   
--   Use the various SetSquadronTakeoff... methods to control how squadrons are taking-off from the airfield:
-- 
--     * :SetSquadronTakeoffInAir() will spawn new aircraft from the squadron directly in the air.
--     * :SetSquadronTakeoffFromParkingCold() will spawn new aircraft in without running engines at a parking spot at the airfield.
--     * :SetSquadronTakeoffFromParkingHot() will spawn new aircraft in with running engines at a parking spot at the airfield.
--     * :SetSquadronTakeoffFromRunway() will spawn new aircraft at the runway at the airfield.
-- 
--   Use these methods to fine-tune for specific airfields that are known to create bottlenecks, or have reduced airbase efficiency.
--   The more and the longer aircraft need to taxi at an airfield, the more risk there is that:
-- 
--     * aircraft will stop waiting for each other or for a landing aircraft before takeoff.
--     * aircraft may get into a "dead-lock" situation, where two aircraft are blocking each other.
--     * aircraft may collide at the airbase.
--     * aircraft may be awaiting the landing of a plane currently in the air, but never lands ...
--   
--   Currently within the DCS engine, the airfield traffic coordination is erroneous and contains a lot of bugs.
--   If you experience while testing problems with aircraft take-off or landing, please use one of the above methods as a solution to workaround these issues!

A2ADispatcher:SetSquadronTakeoffInAir( "Squadron Name" )
A2ADispatcher:SetSquadronTakeoffFromRunway( "Squadron Name" )
A2ADispatcher:SetSquadronTakeoffFromParkingCold( "Squadron Name" )
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "Squadron Name" )


---  I/ FOR EACH SQUADRON, YOU CAN CHANGE THE LANDING METHODS TO OPTIMIZE AIRBASE EFFICIENCY
--   ---------------------------------------------------------------------------------------
--
--   In analogy with takeoff, the landing methods are to control how Squadrons land at the airfield:
-- 
--     * :SetSquadronLandingNearAirbase() will despawn the returning aircraft in the air when near the airfield.
--     * :SetSquadronLandingAtRunway() will despawn the returning aircraft directly after landing at the runway.
--     * :SetSquadronLandingAtEngineShutdown() will despawn the returning aircraft when the aircraft has returned to its parking spot and has turned off its engines.
-- 
--   You can use these methods to minimize the airbase coodination overhead and to increase the airbase efficiency.
--   When there are lots of aircraft returning for landing, at the same airbase, the takeoff process will be halted, which can cause a complete failure of the
--   A2A defense system, as no new CAP or GCI planes can takeoff.
--   Note that the method @{#AI_A2A_DISPATCHER.SetSquadronLandingNearAirbase}() will only work for returning aircraft, not for damaged or out of fuel aircraft.
--   Damaged or out-of-fuel aircraft are returning to the nearest friendly airbase and will land, and are out of control from ground control.

A2ADispatcher:SetSquadronLandingAtRunway( "Squadron Name" )
A2ADispatcher:SetSquadronLandingNearAirbase( "Squadron Name" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "Squadron Name" )


---  J/ FOR EACH SQUADRON WHERE REQUIRED, YOU CAN SETUP CONTROL AIR PATROLS (CAP) TASKS
--   ----------------------------------------------------------------------------------
--
--   Squadrons can perform CAP in zones of different types.
--   
--   J.1/ FOR EACH SQUADRON WHERE REQUIRED, SETUP THE CAP ZONES
--   ----------------------------------------------------------
--   
--   As a first step, you need to define the zones in the mission as outlined in the usage documentation if the AI_A2A_DISPATCHER.
--   
--   Many types of zones can be defined within MOOSE, each with its own MOOSE class that needs to be utilized:
--     1. ZONE: Normal Trigger Zones, defined by setting trigger zones within the mission editor. 
--     2. ZONE_POLYGON: Polygon Zones, defined by a helicopter group placed in the mission, late activated and its waypoints of the route define the polygon zone.
--     3. ZONE_GROUP: Group Zones, where the first Unit of the Group will define the location of the zone, with a define radius.
--     4. ZONE_UNIT: Unit Zones, where the Unit will define the location of the zone, with a defined radius.
--   For further information about zones, please consult the MOOSE Zone module...
--   
--   Depending on the selected Zone type, a zone object needs to be created, which is derived from ZONE_BASE:

---  A polygon zone will be the most used zone for missions to perform CAP.
--   The ZONE_POLYGON class is the class used to define the zone.
--   The :New method (constructor) of the ZONE_POLYGON class takes 2 parameters:
--     1. The Zone Name, this is a free format name.
--     2. A GROUP object, which is defined in the mission, and identified by Group Name.

Zone = ZONE_POLYGON:New( "Zone Name", GROUP:FindByName( "Group Name" ) )

---  A trigger zone can be used to define the zone where to perform CAP.
--   The ZONE class is used to define the zone.
--   The :New method (constructor) of the ZONE class takes one parameters:
--     1. The Zone Name, this is name of the Trigger Zone as defined within the mission editor.

Zone = ZONE:New( "Trigger Zone Name" )

---  A group zone can be used to define the zone where to perform CAP.
--   The ZONE_GROUP class is the class used to define the zone.
--   The :New method (constructor) of the ZONE_GROUP class takes 3 parameters:
--     1. The Zone Name, this is a free format name.
--     2. A GROUP object, which is defined in the mission, and identified by Group Name.
--     3. A radius value in meters, in this example 20000 (20 km), but can be changed to any value.

Zone = ZONE_GROUP:New( "Zone Name", GROUP:FindByName( "Group Name" ), 20000 )

---  A unit zone can be used to define the zone where to perform CAP.
--   The ZONE_UNIT class is the class used to define the zone.
--   The :New method (constructor) of the ZONE_UNIT class takes 3 parameters:
--     1. The Zone Name, this is a free format name.
--     2. A UNIT object, which is defined in the mission, and identified by Unit Name !!! (Not the Group Name!!!)
--     3. A radius value in meters, in this example 20000 (20 km), but can be changed to any value.

Zone = ZONE_GROUP:New( "Zone Name", GROUP:FindByName( "Group Name" ), 20000 )

---  J.2/ FOR EACH SQUADRON, SETUP THE CAP TASK
--   ------------------------------------------
--  
--   Once the CAP zones have been defined, you can now line the CAP zone with the CAP task for the Squadron
--   
--   The method :SetSquadronCap() is used to setup a CAP task for a Squadron.
--   This method takes a couple of parameters:
--     1. SquadronName, The squadron name.
--     2. Zone, The @{Zone} object derived from @{Zone#ZONE_BASE} that defines the zone wherein the CAP will be executed.
--     3. FloorAltitude, The minimum altitude at which the cap can be executed.
--     4. CeilingAltitude, the maximum altitude at which the cap can be executed.
--     5. PatrolMinSpeed, The minimum speed at which the cap can be executed.
--     6. PatrolMaxSpeed, The maximum speed at which the cap can be executed.
--     7. EngageMinSpeed, The minimum speed at which the engage can be executed.
--     8. EngageMaxSpeed, The maximum speed at which the engage can be executed.
--     9. AltType, The altitude type, which is a string "BARO" defining Barometric or "RADIO" defining radio controlled altitude.
--   
--   For example:
--        
--        A2ADispatcher:SetSquadronCap( "Mineralnye", CAPZoneEast, 4000, 10000, 500, 600, 800, 900 )
--     
--     This defines a CAP Task for:
--       - Squadron Name Mineralnye, 
--       - using zone CAPZoneEast,
--       - at an altitude between 4000 and 10000 meters,
--       - patrolling with a speed between 500 and 600 km/h,
--       - engaging to target with a speed between 800 and 900 km/h
--     
--   Please copy for each Squadron the underlying code line, and fill out the parameters.  

A2ADispatcher:SetSquadronCap( "Squadron Name", Zone, FloorAltitude, CeilingAltitude, PatrolMinSpeed, PatrolMinSpeed, EngageMinSpeed, EngageMaxSpeed, AltType )

---  J.3/ FOR EACH CAP TASK, YOU CAN MODIFY THE CAP INTERVAL
--   -------------------------------------------------------
--   
--   For each CAP task defined for the Squadron, you can modify the CAP interval.
--   
--   Use the method :SetSquadronCapInterval to modify the following CAP task parameters:
--     1. Squadron Name, The Squadron Name
--     2. Amount, The Maximum amount of CAP Groups that will patrol simulateously (Default is 1).
--     3. MinTime, The Minimum time interval in seconds, when a new CAP may launch (Default is 300 seconds).
--     4. MaxTime, The Maximum time interval in seconds, when a new CAP may launch (Default is 600 seconds).
--   
--   For example:
--   
--       A2ADispatcher:SetSquadronCapInterval( "Mineralnye", 2, 30, 60 )
-- 
--     This modifies additional a CAP Task parameters for:
--       - Squadron Name Mineralnye, 
--       - Maximum 2 CAP groups,
--       - only spawn a new CAP after 30 seconds minimum,
--       - but do not spawn a new CAP after 60 seconds maximum,
--       
--   Please copy for each Squadron the underlying code line, and fill out the parameters.  

A2ADispatcher:SetSquadronCapInterval( "Squadron Name", Amount, MinTime, MaxTime )



---  H/ FOR EACH SQUADRON WHERE REQUIRED, YOU CAN SETUP GROUND INTERCEPT (GCI) TASKS
--   -------------------------------------------------------------------------------
-- 
--   For each Squadron, you can setup a GCI task.
--   
--   The method :SetSquadronGci() is used to define the GCI command.
--   It takes 3 parameters:
--     1. Squadron Name, The Squadron Name
--     2. MinEngageSpeed, The minimum engage speed
--     3. MaxEngageSpeed, The maximum engage speed
-- 
--   For example:
--   
--       A2ADispatcher:SetSquadronGci( "Mozdok", 900, 1200 )
--       
--     This will define a GCI task for Squadron "Mozdok", which will engage with a minimum speed of 900 km/h and a maximum speed of 1200 km/h.
--     
--   Please copy for each Squadron the underlying code line for which you want to define GCI, and fill out the parameters.  
--   

A2ADispatcher:SetSquadronGci( "Squadron Name", MinEngageSpeed, MaxEngageSpeed )



---  I/ WHATS NEXT?
--   --------------
-- 
--   If you want to define AI_A2A_DISPATCHER for two coalitions, do the above process for both the blue and red coalitions separately.
--     1. So you will define TWO AI_A2A_DISPATCHER objects, for example A2ARedDispatcher, and A2ABlueDispatcher.
--     2. For each dispatcher object, define the Border Zones, Engage Radius, Squadrons, Squadron tasks.
--   
--   While doing this coding style, you'll get familiar with how easy it actually is to use MOOSE.
--   
--   THERE ARE MANY MORE MOOSE CLASSES THAT YOU CAN USE, FOLLOWING THE SAME CODING PRINCIPLES!
