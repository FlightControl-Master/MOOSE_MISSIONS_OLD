-- This test mission demonstrates the BEACON class.
-- The goal is to activate 2 types of beacons : 1 TACAN beacon attach to an aircraft, and 1 generic radio beacon attach to a ground UNIT

-- The player aircraft needs to be ASM and TACAN compatible. Please replace the M2000C by an aircraft you own and can receive TACAN signals

-- Activates the trace to see what BEACON does in the log
--BASE:TraceClass("BEACON")
BASE:TraceLevel(3)

-- Create our UNITs on which we'll attach a BEACON
local Aircraft = UNIT:FindByName("Unit1")
local LandUnit = UNIT:FindByName("Unit2")

-- Now, let's start with the TACAN Beacon.
-- Note that they are limited to Y band. Notice also that this particular TACAN can be homed on.
local BeaconAircraft = Aircraft:GetBeacon()
BeaconAircraft:AATACAN(6, "UNIT1", true)

-- And let's setup the ground based radio beacon !
-- Notice how this beacon will stop in 20 sec (last parameter).
local BeaconLand = LandUnit:GetBeacon()
BeaconLand:RadioBeacon("Morse.ogg", 129, radio.modulation.AM, 100, 20)