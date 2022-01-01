CreateThread(function()
    for k,v in pairs(Config.Props) do
        TriggerEvent('propSpawn', v.model, v.coords)
    end
end)

RegisterNetEvent('propSpawn', function(model, coords)
    RequestModel(model)
    local iter_for_request = 1
    while not HasModelLoaded(model) and iter_for_request < 5 do
        Citizen.Wait(500)                
        iter_for_request = iter_for_request + 1
    end
    if not HasModelLoaded(model) then
        SetModelAsNoLongerNeeded(model)
    else
        local ped = PlayerPedId()
        local x,y,z,h = table.unpack(coords)
        local created_object = CreateObjectNoOffset(model, x, y, z - 1, 1, 0, 1)
        PlaceObjectOnGroundProperly(created_object)
        SetEntityHeading(created_object, h)
        FreezeEntityPosition(created_object, true)
        SetModelAsNoLongerNeeded(model)
    end
end)