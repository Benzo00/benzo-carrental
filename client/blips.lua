CreateThread(function()
   for i = 1, #Config.CarRental do
        if Config.CarRental[i].Enabled then
            local Blip = AddBlipForCoord(Config.CarRental[i].Menucoords)
            SetBlipSprite(Blip, Config.CarRental[i].Sprite)
            SetBlipDisplay(Blip, Config.CarRental[i].Display)
            SetBlipScale(Blip, Config.CarRental[i].Scale)
            SetBlipAsShortRange(Blip, true)
            SetBlipColour(Blip, Config.CarRental[i].Color)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.CarRental[i].Label)
            EndTextCommandSetBlipName(Blip)
        end
    end
end)