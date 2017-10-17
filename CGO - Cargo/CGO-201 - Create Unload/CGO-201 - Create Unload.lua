
Crate = CARGO_CRATE:New( "Ammo", "Amunition", "Ammo1", 25 )

CargoCarrier = UNIT:FindByName( "Carrier" )

-- This will Load the crate into the Carrier, regardless where the crate is.
Crate:Load( CargoCarrier )

-- This will Unload the crate from the Carrier.
Crate:UnLoad()