CreateThread(function()
    function PropSpawn()
        for k,v in pairs (Config.Props) do
            RequestModel(v.model)
            local iter_for_request = 1
            while not HasModelLoaded(v.model) and iter_for_request < 5 do
                Wait(500)                
                iter_for_request = iter_for_request + 1
            end
            if not HasModelLoaded(v.model) then
                SetModelAsNoLongerNeeded(v.model)
            else
                local ped = PlayerPedId()
                local created_object = CreateObjectNoOffset(v.model, v.coords.x, v.coords.y, v.coords.z - 1, 1, 0, 1)
                PlaceObjectOnGroundProperly(created_object)
                SetEntityHeading(created_object, v.coords.w)
                FreezeEntityPosition(created_object, true)
                SetModelAsNoLongerNeeded(v.model)
            end
        end
    end
end)
