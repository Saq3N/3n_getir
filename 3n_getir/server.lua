ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('3n_getir:getirstokal')
AddEventHandler("3n_getir:getirstokal", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.canCarryItem("siparisposeti", 1) then
        xPlayer.addInventoryItem("siparisposeti", 1)
    else
        TriggerClientEvent('esx:showNotification', source, 'Üzerinde yeterli alan yok.')
    end
end)


RegisterServerEvent('3n_getir:siparisiver')
AddEventHandler('3n_getir:siparisiver', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem('siparisposeti').count >= 1 then
        xPlayer.removeInventoryItem('siparisposeti', 1)
        Citizen.Wait(500)
        xPlayer.addMoney(5000)
    end
end)

ESX.RegisterServerCallback('3n_getir:malzemekontrolet', function(source, cb, item, gereklisayi)
	local xPlayer = ESX.GetPlayerFromId(source)
    local itemcount = xPlayer.getInventoryItem(item).count
    local itemname = xPlayer.getInventoryItem(item).label
	if itemcount >= gereklisayi then
		cb(true)
	else
        activity = 0
        TriggerClientEvent('esx:showNotification', source, 'Üzerinde yeterli '..itemname..' yok!')
	end
end)

