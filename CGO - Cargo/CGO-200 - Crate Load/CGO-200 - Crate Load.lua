

Crate = CARGO_CRATE:New( "Ammo", "Amunition", "Ammo1", 25 )

CargoCarrier = UNIT:FindByName( "Carrier" )

-- This call will load the Crate into the CargoCarrier.
Crate:Load( CargoCarrier ) 

