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