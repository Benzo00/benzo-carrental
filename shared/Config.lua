Config = {}

Config.DefaultOpenKey = "E"
Config.CarPapers = "carrentalpaper"
Config.Currency = "$"

Config.RentalCars = {
    {
        Label = "Blista",
        SpawnName = "blista",
        Price = 700,
    }, 
    {
        Label = "Coach",
        SpawnName = "coach",
        icon = "fa-solid fa-bus",
        Price = 1200,
    },
    {
        Label = "Hauler",
        SpawnName = "hauler",
        icon = "fa-solid fa-truck-front",
        Price = 1500,
    }, 
    {
        Label = "Tipper",
        SpawnName = "TipTruck",
        icon = "fa-solid fa-truck-pickup",
        Price = 900,
    },
    {
        Label = "Tipping Deep",
        SpawnName = "TipTruck2",
        icon = "fa-solid fa-truck-pickup",
        Price = 950,
    },
    {
        Label = "Journey",
        SpawnName = "journey",
        icon = "fa-solid fa-van-shuttle",
        Price = 100,
    },
    {
        Label = "Tractor",
        SpawnName = "tractor",
        icon = "fa-solid fa-tractor",
        Price = 90,
    },
    {
        Label = "Bmx",
        SpawnName = "bmx",
        icon = "fa-solid fa-bicycle",
        Price = 20,
    },
    {
        Label = "Scorcher",
        SpawnName = "scorcher",
        icon = "fa-solid fa-bicycle",
        Price = 40,
    },

}

Config.CarRental = {
     {
        Menucoords = vec3(54.39, -877.71, 30.3),
        VehicleSpawncoords = vec4(49.50, -880.19, 30.3, 68.03),
        Returncoords = vec3(44.01, -871.06, 30.44),
        MarkerDistanceCheck = 10.0,
        InteractDistanceCheck = 3.0,
        ---  Blip
        Enabled = true,
        Sprite = 56,
        Display = 6,
        Scale = 0.8,
        Color = 65,
        Label = "Car Rental"        
    },
    {
        Menucoords = vec3(1775.419800, 3347.578125, 40.636597),
        VehicleSpawncoords = vec4(1779.085693, 3342.567139, 40.805176, 212.598419),
        Returncoords = vec3(1768.166992, 3338.901123, 41.260132),
        MarkerDistanceCheck = 10.0,
        InteractDistanceCheck = 3.0,
        ---  Blip
        Enabled = true,
        Sprite = 56,
        Display = 6,
        Scale = 0.8,
        Color = 65,
        Label = "Sandy Rental"
        
    },
    {
        Menucoords = vec3(169.424179, 6627.151855, 31.739868),
        VehicleSpawncoords = vec4(181.239563, 6633.257324, 31.554565, 172.913391),
        Returncoords = vec3(181.239563, 6633.257324, 31.554565),
        MarkerDistanceCheck = 10.0,
        InteractDistanceCheck = 3.0,
        ---  Blip
        Enabled = true,
        Sprite = 56,
        Display = 6,
        Scale = 0.8,
        Color = 65,
        Label = "Paleto Bay Rental"
        
    },
}
