local recoilEnabled = true -- Toggle for enabling/disabling recoil
local recoilAmount = 100.01 -- Recoil intensity (change the value as you see fit)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local playerPed = PlayerPedId()
        
        -- Checking if the player is in shooting mode and recoil is enabled
        if IsPedShooting(playerPed) and recoilEnabled then
            local pitch, roll, yaw = GetGameplayCamRot(2)
            
            -- Generating random recoil around the Y axis (horizontal deviation)
            local recoilY = math.random() * recoilAmount * 2 - recoilAmount
            
            -- Generating random recoil around the X axis (vertical deviation)
            local recoilX = math.random() * recoilAmount * 2 - recoilAmount
            
            -- Applying recoil to the camera position
            SetGameplayCamRelativePitch(recoilX, 0.2)
            --SetGameplayCamRelativeHeading(recoilY)
        end
    end
end)
