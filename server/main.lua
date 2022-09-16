
local ox_inventory = exports.ox_inventory


local function GetVehiclePrice(veh)
    for i=1, #Config.RentalCars do 
        if Config.RentalCars[i].SpawnName == veh then
            return Config.RentalCars[i].Price
        end
    end
end

ESX.RegisterServerCallback("benzo-carrental:givepapers", function(source, cb, CurrentRental, Car, model, automobile)
    local xPlayer = ESX.GetPlayerFromId(source)
    local HasItem = xPlayer.hasItem(Config.CarPapers).count > 0
    local xPlayer = ESX.GetPlayerFromId(source)
    local VehPrice = GetVehiclePrice(model)
      local Plate = string.format("R %s%s%s%s%s%s", math.random(0, 9), math.random(0, 9), math.random(0, 9), math.random(0, 9), math.random(0, 9), math.random(0, 9))
    if not VehPrice then
        cb(false, "Invalid Vehicle")
        return
    end
    if HasItem then
        return cb(false, "You already have car papers, Please return the vehicle")
    end
    local HasMoney = xPlayer.getMoney() >= VehPrice
    if HasMoney then
        xPlayer.removeMoney(VehPrice)
    else
        cb(false, "You don't have enough money to rent this car")
        return
    end
    print("Car: " .. Car)
    print("Plate: " .. Plate)
    print("Model: " .. model)
    local current_rental = Config.CarRental[CurrentRental]
    ESX.OneSync.SpawnVehicle(model, vector3(current_rental.VehicleSpawncoords.xyz), 0.0, false,{plate = Plate, }, function(vehicle)
        local vehicle = NetworkGetEntityFromNetworkId(vehicle)
        print("Vehicle: " .. vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
        xPlayer.addInventoryItem(Config.CarPapers, 1, " Proof of Rental Ownership of " .. Car .. " Plate:" .. Plate)
    end)
    cb(true)
end)

ESX.RegisterServerCallback("benzo-carrental:removepapers", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local Item = xPlayer.getInventoryItem(Config.CarPapers)
    if Item then
        xPlayer.removeInventoryItem(Config.CarPapers, 1)
        cb(true)
    else
        cb(false)
    end
end)
