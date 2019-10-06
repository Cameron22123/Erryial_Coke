

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




RegisterServerEvent("KCoke:get")
AddEventHandler("KCoke:get", function()
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	
		
				if xPlayer.getInventoryItem('coke').count <= 20 then
					xPlayer.addInventoryItem("coke", math.random(1,2))
					else
					TriggerClientEvent('esx:showNotification', source, '~r~You cant hold any more coca leaves')
				end

			
end)
ESX.RegisterServerCallback("KCoke:getProduct", function(source, cb, product)
    	local _source = source	
	print(source)
	print(cb)
	print(product)
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if product == nil then		
		TriggerClientEvent("pNotify:SendNotification", _source, {
    			text = "You don't have any end product ready.",
    			type = "error",
    			queue = "lmao",
    			timeout = 3000,
    			layout = "centerLeft"	
		})
	cb(false)
	
	else
	xPlayer.addInventoryItem(product, 1)

	end
end)
ESX.RegisterServerCallback("KCoke:getProductCrack", function(source, cb)
    	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	
	xPlayer.addInventoryItem("crack_pooch", 1)
	cb(true)
end)
ESX.RegisterServerCallback("KCoke:getProductCoke", function(source, cb)
    	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	
	xPlayer.addInventoryItem("coke_pooch", 1)
	cb(true)
end)





ESX.RegisterServerCallback('KCoke:process', function (source, cb)
	
	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
			
			
				if xPlayer.getInventoryItem('coke').count >= 2 then
					xPlayer.removeInventoryItem('coke', 2) 
					xPlayer.addInventoryItem('coke_pooch', 1) 

				else
				TriggerClientEvent('esx:showNotification', source, '~r~Not enough coca leaves')
				cb(false)
				end
			

end)
ESX.RegisterServerCallback('KCoke:grind', function (source, cb)
	
	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
			
			
				if xPlayer.getInventoryItem('coke').count >= 2 then
					xPlayer.removeInventoryItem('coke', 2) 
					xPlayer.addInventoryItem('coke_con', 1)
				TriggerClientEvent("pNotify:SendNotification", _source, {
		    			text = "You grind your materials into a concoction.",
		    			type = "success",
		    			queue = "lmao",
		    			timeout = 3000,
		    			layout = "centerLeft"	
				})
					cb(true)
				else
				TriggerClientEvent("pNotify:SendNotification", _source, {
		    		text = "You don't have enough materials.",
		    		type = "error",
		    		queue = "lmao",
		    		timeout = 3000,
		    		layout = "centerLeft"	
				})
				cb(false)
				end
			

end)
ESX.RegisterServerCallback('KCoke:addAcid', function (source, cb)
	
	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
			
			
				if xPlayer.getInventoryItem('hcl').count >= 1 then
					xPlayer.removeInventoryItem('hcl', 1) 
				TriggerClientEvent("pNotify:SendNotification", _source, {
		    			text = "You pour your acid into the vats.",
		    			type = "success",
		    			queue = "lmao",
		    			timeout = 3000,
		    			layout = "centerLeft"	
				})
					print("test")
					cb(true)
				else
				TriggerClientEvent("pNotify:SendNotification", _source, {
		    		text = "You don't have anymore acid.",
		    		type = "error",
		    		queue = "lmao",
		    		timeout = 3000,
		    		layout = "centerLeft"	
				})
				cb(false)
				end
			
end)
ESX.RegisterServerCallback('KCoke:addIngred', function (source, cb)
	
	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
			
			
				if xPlayer.getInventoryItem('coke_con').count >= 1 then
					xPlayer.removeInventoryItem('coke_con', 1) 
				TriggerClientEvent("pNotify:SendNotification", _source, {
		    			text = "You dump your concoction into the vat.",
		    			type = "success",
		    			queue = "lmao",
		    			timeout = 3000,
		    			layout = "centerLeft"	
				})
					print("test")
					cb(true)
				else
				TriggerClientEvent("pNotify:SendNotification", _source, {
		    		text = "You don't have anymore concoction to dump.",
		    		type = "error",
		    		queue = "lmao",
		    		timeout = 3000,
		    		layout = "centerLeft"	
				})
				cb(false)
				end
			
end)




RegisterServerEvent("KCoke:OnNotification")
AddEventHandler("KCoke:OnNotification", function(isOn)
	print("We're in the server event")
	if isOn then
		-- Turning 
		TriggerClientEvent("pNotify:SendNotification", _source, {
		    text = "The noises from the machines seem to slow down and shut off",
		    type = "success",
		    queue = "lmao",
		    timeout = 3000,
		    layout = "bottomCenter"	
		})
	else	
		-- Turning on
		TriggerClientEvent("pNotify:SendNotification", _source, {
		    text = "The machines seem to buzz and whirr into life",
		    type = "success",
		    queue = "lmao",
		    timeout = 3000,
		    layout = "bottomCenter"	
		})
	end
end)

