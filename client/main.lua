--- For Support join https://discord.gg/pyKDCByzUk

local Rented = false

local function SpawnCar(SelectedData, CurrentRental)
    local Ped = ESX.PlayerData.ped
    DoScreenFadeOut(1500)
    Wait(1500)
    ESX.TriggerServerCallback("benzo-carrental:givepapers", function(Success, reason)
    DoScreenFadeIn(1500)
    Rented = Success
    if not Success then
        ESX.ShowNotification(reason, "error")
        return
    end
    end, CurrentRental, SelectedData.Label,SelectedData.SpawnName, IsThisModelACar(joaat(SelectedData.SpawnName)))
end

RegisterCommand("fix", function()
    DoScreenFadeOut(1500)
    Wait(1500)
     DoScreenFadeIn(1500)
end)

local function ReturnCar()
    if Rented then
        local Ped = ESX.PlayerData.ped
        local vehicle = GetVehiclePedIsIn(Ped)
        DoScreenFadeOut(1500)
        ESX.Game.DeleteVehicle(vehicle)
        ESX.TriggerServerCallback('benzo-carrental:removepapers', function(cb)
        DoScreenFadeIn(1500)
            Rented = false
            ESX.ShowNotification("You returned your rental car")
        end)
    end
end

local function RentalMenu(Index)
    local Elements = {{
        unselectable = true,
        title = "Rental Cars",
        icon ="fa-solid fa-car-burst"
    }}
    for i = 1, #Config.RentalCars do
        Elements[#Elements + 1] = {
            title = Config.RentalCars[i].Label,
            description = "Price: " .. Config.Currency .. Config.RentalCars[i].Price,
            icon = Config.RentalCars[i].icon or "fa-solid fa-car",
            value = "car",
            Data = Config.RentalCars[i]
        }
    end

    ESX.OpenContext("right", Elements, function(menu, element)
        local SelectedData = element.Data
        if element.value == "car" then
            ESX.CloseContext()
            SpawnCar(SelectedData, Index)
        end

    end, function(menu)
    end)
end


local CurrentDrawing = ""
CreateThread(function()
    while true do
        local Sleep = 1500
        local Ped = ESX.PlayerData.ped
        local PlayerCoords = GetEntityCoords(Ped)
        local Near = false 
        for i=1, #Config.CarRental do 
            local Distance = #(PlayerCoords - Config.CarRental[i].Menucoords)
            if Distance < Config.CarRental[i].MarkerDistanceCheck then
                Sleep = 0
                DrawMarker(21, Config.CarRental[i].Menucoords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 187, 255, 0, 255, true, true,
                    2, nil, nil, false)
                if  Distance < Config.CarRental[i].InteractDistanceCheck then
                    Near = true
                    if CurrentDrawing ~= "Press ~b~[E]~s~ to rent a ~b~Vehicle" then
                        ESX.TextUI("Press ~b~[E]~s~ to rent a ~b~Vehicle")
                        CurrentDrawing = "Press ~b~[E]~s~ to rent a ~b~Vehicle"
                    end
                end
            end
                local Distance2 = #(PlayerCoords - Config.CarRental[i].Returncoords)
                if Distance2 < Config.CarRental[i].MarkerDistanceCheck then
                    Sleep = 0
                    if Rented then
                        DrawMarker(21, Config.CarRental[i].Returncoords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 187, 255, 0, 255,
                            true, true, 2, nil, nil, false)
                            if  Distance2 < Config.CarRental[i].InteractDistanceCheck then
                                Near = true
                                if CurrentDrawing ~= "Press ~b~[E]~s~ to Return a ~b~Vehicle" then
                                    ESX.TextUI("Press ~b~[E]~s~ to Return a ~b~Vehicle")
                                    CurrentDrawing = "Press ~b~[E]~s~ to Return a ~b~Vehicle"
                                end
                            end
                    end
                end
        end
        if not Near and CurrentDrawing ~= "" then
            CurrentDrawing = ""
            ESX.HideUI()
        end
        Wait(Sleep)
    end
end)

ESX.RegisterInput("carrental", "[B-CarRental] Open Menu", "keyboard", Config.DefaultOpenKey, function()
    for i=1, #Config.CarRental do
        local Ped = ESX.PlayerData.ped
        local PlayerCoords = GetEntityCoords(Ped)
        local Distance = #(PlayerCoords - Config.CarRental[i].Menucoords)
        if Distance < Config.CarRental[i].InteractDistanceCheck then
            RentalMenu(i)
        else
            local Distance = #(PlayerCoords - Config.CarRental[i].Returncoords)
            if Distance < Config.CarRental[i].InteractDistanceCheck then
                ReturnCar()
            end
        end
    end 
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    ESX.CloseContext()
end)

