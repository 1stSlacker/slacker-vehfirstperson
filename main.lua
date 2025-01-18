local isInVehicle = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            isInVehicle = true
        else
            isInVehicle = false
        end

        if isInVehicle then
            if IsControlPressed(0, 25) then -- Right mouse button and player is aiming
                SetFollowVehicleCamViewMode(4) -- First person
            elseif IsPlayerFreeAiming(PlayerId()) then
                SetFollowVehicleCamViewMode(4) -- First person when free aiming
            else
                SetFollowVehicleCamViewMode(0) -- Third person
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()

        if IsPedOnAnyBike(playerPed) then
            sleep = 1 -- Reduce wait time to make the script more responsive

            if IsControlJustPressed(0, 25) then -- Right mouse button pressed
                SetCamViewModeForContext(2, 3) -- First-person view for bikes
            elseif IsControlJustReleased(0, 25) then -- Right mouse button released
                SetCamViewModeForContext(2, 0) -- Third-person view for bikes
            end
        end

        Wait(sleep)
    end
end)
