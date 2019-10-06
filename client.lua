

ESX = nil
Citizen.CreateThread(function()
	while true do
		Wait(5)
		if ESX ~= nil then
		
		else
			ESX = nil
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		end
	end
end)

local acidLevel = 5.0
local acidLoad = 0
local temperature = 70
local ingredLoad = 0
local product = {}
local isOn = false
local mistakes = 0
local callback = nil

local locations = {}


local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local spawned = false
Citizen.CreateThread( function()
Citizen.Wait(10000)
while true do
Citizen.Wait(1000)
	if GetDistanceBetweenCoords(Config.PickupBlip.x,Config.PickupBlip.y,Config.PickupBlip.z, GetEntityCoords(GetPlayerPed(-1))) <= 200 then
		if spawned == false then
			TriggerEvent('ECoke:start')
			TriggerEvent('ECoke:start')
			TriggerEvent('ECoke:start')
			TriggerEvent('ECoke:start')
			TriggerEvent('ECoke:start')
			TriggerEvent('ECoke:start')
			TriggerEvent('ECoke:start')
			TriggerEvent('ECoke:start')
			TriggerEvent('ECoke:start')
			TriggerEvent('ECoke:start')
			TriggerEvent('ECoke:start')
		end
		spawned = true
	else
		if spawned then
			locations = {}
		end
		spawned = false
		
	end
end
end)


local displayed = false
local menuOpen = false
--[[
local blipPickup = AddBlipForCoord(Config.PickupBlip.x,Config.PickupBlip.y,Config.PickupBlip.z)

			SetBlipSprite (blipPickup, 514)
			SetBlipDisplay(blipPickup, 4)
			SetBlipScale  (blipPickup, 1.1)
			SetBlipColour (blipPickup, 24)
			SetBlipAsShortRange(blipPickup, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Cocoa Leaves Plantation")
			EndTextCommandSetBlipName(blipPickup)
			
local blipProcess = AddBlipForCoord(Config.Processing.x, Config.Processing.y, Config.Processing.z)

			SetBlipSprite (blipProcess, 514)
			SetBlipDisplay(blipProcess, 4)
			SetBlipScale  (blipProcess, 1.1)
			SetBlipColour (blipProcess, 24)
			SetBlipAsShortRange(blipProcess, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Cocaine production")
			EndTextCommandSetBlipName(blipProcess)
--]]
			


local process = true
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
	playerCoords = GetEntityCoords(GetPlayerPed(-1))
			--pick up spot
		
			for k in pairs(locations) do
				if GetDistanceBetweenCoords(locations[k].x, locations[k].y, locations[k].z, GetEntityCoords(GetPlayerPed(-1))) < 150 then			
					DrawMarker(3, locations[k].x, locations[k].y, locations[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 200, 0, 110, 0, 1, 0, 0)	
					
					if GetDistanceBetweenCoords(locations[k].x, locations[k].y, locations[k].z, GetEntityCoords(GetPlayerPed(-1)), false) < 2 then			
						TriggerServerEvent('ECoke:get')
						TriggerEvent('ECoke:new', k)
					end
				
				end
			end
			--Put ingrediant spot
			if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1))) < 150 then			
					DrawMarker(1, Config.Processing.x, Config.Processing.y, Config.Processing.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.0, 0, 200, 0, 110, 0, 1, 0, 0)	
					if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1.5 then			
						Draw3DText( Config.Processing.x, Config.Processing.y, Config.Processing.z , "~w~Cocaine Production~y~\nPress [~b~E~y~] to load ingredients.\n~w~"..ingredLoad.." concoctions",4,0.15,0.1)
						--Change this for all of them
						if IsControlJustReleased(0, Keys['E']) then
							Citizen.CreateThread(function()
								
								--Check if they have cocaine concoction
								--if they do, put it in
								--increment ingrediant
								--if not
								--notify they don't have enough
								--Put number of ingrediant on post
							end)
						end
					end
					
					if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) < 20 and GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) > 3 then
						process = false
					end
				end
			--Show Switch to Start/Stop
			if GetDistanceBetweenCoords(Config.Switch.x, Config.Switch.y, Config.Switch.z, GetEntityCoords(GetPlayerPed(-1))) < 150 then			
					DrawMarker(1, Config.Switch.x, Config.Switch.y, Config.Switch.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.0, 0, 200, 0, 110, 0, 1, 0, 0)	
					if GetDistanceBetweenCoords(Config.Switch.x, Config.Switch.y, Config.Switch.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1.5 then			
						--Notify You hear the machines begin to buzz
						--Add logic to show different stuff based on isOn
						if isOn then
						Draw3DText( Config.Switch.x, Config.Switch.y, Config.Switch.z , "~w~On/Off Switch~y~\nPress [~b~E~y~] to Turn the Machine off.",4,0.15,0.1)
						else 
						Draw3DText( Config.Switch.x, Config.Switch.y, Config.Switch.z , "~w~On/Off Switch~y~\nPress [~b~E~y~] to Turn the Machine on.",4,0.15,0.1)
						end
						if IsControlJustReleased(0, Keys['E']) then
							--Change this for all of them
							Citizen.CreateThread(function()
								--Notify you hear the machines start to whirr and buzz
								if isOn then
									isOn = not isOn
					TriggerEvent("pNotify:SendNotification", {
					text = "The machine quiets down slowly.",
					type = "success",
					queue = "wow",
					timeout = "5000",
					layout = "centerLeft"
					})
					
								else
								if ingredLoad > 4 then
					TriggerEvent("pNotify:SendNotification", {
					text = "The machine slowly begins to hum to life.",
					type = "success",
					queue = "wow",
					timeout = "5000",
					layout = "centerLeft"
					})
									TriggerEvent("ECoke:OnNotification", isOn)
									isOn = not isOn
									ingredLoad = ingredLoad - 5
									Citizen.Wait(500)
								else
					TriggerEvent("pNotify:SendNotification", {
					text = "The machine is empty!",
					type = "error",
					queue = "wow",
					timeout = "3000",
					layout = "centerLeft"
					})
								end
								end

									
							end)
						end
					end
					
					if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) < 20 and GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) > 3 then
						process = false
					end
				end
			-- Temperature
			if GetDistanceBetweenCoords(Config.Temperature.x, Config.Temperature.y, Config.Temperature.z, GetEntityCoords(GetPlayerPed(-1))) < 150 then			
					DrawMarker(1, Config.Temperature.x, Config.Temperature.y, Config.Temperature.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.0, 0, 200, 0, 110, 0, 1, 0, 0)	
					if GetDistanceBetweenCoords(Config.Temperature.x, Config.Temperature.y, Config.Temperature.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1.5 then			
						Draw3DText( Config.Temperature.x, Config.Temperature.y, Config.Temperature.z , "~w~Temperature~y~\nPress [~b~E~y~] to lower the temperature.\n~w~"..temperature.." F",4,0.15,0.1)
						if IsControlJustReleased(0, Keys['E']) then
							--Change this for all of them
							Citizen.CreateThread(function()
								if temperature - 10 > 0 then
								temperature = temperature - 10 
								--Add animation here?
								Citizen.Wait(500)
								end
							end)
						end
					end
					
					if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) < 20 and GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) > 3 then
						process = false
					end
				end
			--Grind
			if GetDistanceBetweenCoords(Config.Grind.x, Config.Grind.y, Config.Grind.z, GetEntityCoords(GetPlayerPed(-1))) < 150 then			
					DrawMarker(1, Config.Grind.x, Config.Grind.y, Config.Grind.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.0, 0, 200, 0, 110, 0, 1, 0, 0)	
					if GetDistanceBetweenCoords(Config.Grind.x, Config.Grind.y, Config.Grind.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1.5 then			
						Draw3DText( Config.Grind.x, Config.Grind.y, Config.Grind.z , "~w~Grinder~y~\nPress [~b~E~y~] to grind the materials.",4,0.15,0.1)
						if IsControlJustReleased(0, Keys['E']) then
							--Change this for all of them
							Citizen.CreateThread(function()
								local grindResult
								ESX.TriggerServerCallback('ECoke:grind', function(output)
									grindResult = output
								end)
								--Check if they have a coco leaf
								--If they do, take it, and make it
								--into a cocaine concoction
							end)
						end
					end
					
					if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) < 20 and GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) > 3 then
						process = false
					end
				end
			--Acid
			if GetDistanceBetweenCoords(Config.Acid.x, Config.Acid.y, Config.Acid.z, GetEntityCoords(GetPlayerPed(-1))) < 150 then			
					DrawMarker(1, Config.Acid.x, Config.Acid.y, Config.Acid.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.0, 0, 200, 0, 110, 0, 1, 0, 0)	
					if GetDistanceBetweenCoords(Config.Acid.x, Config.Acid.y, Config.Acid.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1.5 then			
						Draw3DText( Config.Acid.x, Config.Acid.y, Config.Acid.z , "~w~Acid~y~\nPress [~b~E~y~] to raise your PH level\n~w~"..acidLevel.." ph",4,0.15,0.1)
						if IsControlJustReleased(0, Keys['E']) then
							--Change this for all of them
							Citizen.CreateThread(function()
								if acidLoad ~= 0 and acidLevel - 0.5 > 0.0 then
									acidLoad = acidLoad - 1
									acidLevel = acidLevel - 0.5
									Citizen.Wait(500)
								else 
								end
							end)
						end
					end
					
					if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) < 20 and GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) > 3 then
						process = false
					end
				end


			--EndProduct
			if GetDistanceBetweenCoords(Config.EndProduct.x, Config.EndProduct.y, Config.EndProduct.z, GetEntityCoords(GetPlayerPed(-1))) < 150 then			
					DrawMarker(1, Config.EndProduct.x, Config.EndProduct.y, Config.EndProduct.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.0, 0, 200, 0, 110, 0, 1, 0, 0)	
					if GetDistanceBetweenCoords(Config.EndProduct.x, Config.EndProduct.y, Config.EndProduct.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1.5 then			
						Draw3DText( Config.EndProduct.x, Config.EndProduct.y, Config.EndProduct.z , "~w~End Product~y~\nPress [~b~E~y~] to pick up your product.",4,0.15,0.1)
						if IsControlJustReleased(0, Keys['E']) then
							--Change this for all of them
							Citizen.CreateThread(function()
								item = product[1]
								if item == "coke_pooch"then
								ESX.TriggerServerCallback('ECoke:getProductCoke', function(output)
									item = output
								end)
								
								product[1] = nil
								table.insert(product, 1, table.remove(product, #product))
								else if item == "crack_pooch" then
								ESX.TriggerServerCallback('ECoke:getProductCrack', function(output)
									item = output
								end)
								
								product[1] = nil
								table.insert(product, 1, table.remove(product, #product))
								else
								--notification
								end
							

								end
								
							end)
						end
					end
					
					if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) < 20 and GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) > 3 then
						process = false
					end
				end
			--Acid Mixture
			if GetDistanceBetweenCoords(Config.AcidMixture.x, Config.AcidMixture.y, Config.AcidMixture.z, GetEntityCoords(GetPlayerPed(-1))) < 150 then			
					DrawMarker(1, Config.AcidMixture.x, Config.AcidMixture.y, Config.AcidMixture.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3, 1.0, 0, 200, 0, 110, 0, 1, 0, 0)	
					if GetDistanceBetweenCoords(Config.AcidMixture.x, Config.AcidMixture.y, Config.AcidMixture.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1.5 then			
						Draw3DText( Config.AcidMixture.x, Config.AcidMixture.y, Config.AcidMixture.z , "~w~Acid Mixture~y~\nPress [~b~E~y~] to mix your acid.\n~w~"..acidLoad.." liters",4,0.15,0.1)
						if IsControlJustReleased(0, Keys['E']) then
							--Change this for all of them
							Citizen.CreateThread(function()
								local result = false
								ESX.TriggerServerCallback('ECoke:addAcid', function(output)
									if output == true then 
										acidLoad = acidLoad + 1
									end
								end)
								--if they have one
								--Increment if successful
								--might have to do a callback
							end)
						end
					end
					
					if GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) < 20 and GetDistanceBetweenCoords(Config.Processing.x, Config.Processing.y, Config.Processing.z, GetEntityCoords(GetPlayerPed(-1)), true) > 3 then
						process = false
					end
				end




			
	--[[		
	for k,v in ipairs(Config.FastTravels) do
		local distance = GetDistanceBetweenCoords(playerCoords, v.From, true)
		if distance < Config.DrawDistance then
			DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil,nil,false)
		end
		if distance < v.Marker.x then
			FastTravel(v.To.coords, v.To.heading)
		end
	end
	--]]
			
    end
end)

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()
	DoScreenFadeOut(800)
	while not IsScreenFadedOut() do 
		Citizen.Wait(500)
	end
	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)
		if heading then 
			SetEntityHeading(playerPed, heading)
		end
	end)
end

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
		 if inDist then
			SetTextColour(0, 190, 0, 220)		-- You can change the text color here
		 else
		 	SetTextColour(220, 0, 0, 220)		-- You can change the text color here
		 end
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
end
--[[
function Process()
process = true
local making = true
	while making and process do
	TriggerEvent('esx:showNotification', '~g~Starting ~w~Cocaine ~g~production')
	Citizen.Wait(5000)
	
	ESX.TriggerServerCallback('ECoke:process', function(output)
			making = output
		end)

	end
end
]]--
--Might have to create multiple of these for PH, Temperature, and loader
Citizen.CreateThread(function()
    while true do
	if isOn then
        	Citizen.Wait(200)
		if temperature + 1 < 251 then
			temperature = temperature + 1
		end
	else
		Citizen.Wait(1000)
	end
    end
end)
Citizen.CreateThread(function()
    while true do
	if isOn then
        	Citizen.Wait(500)
		if acidLevel + 0.1 < 14.0 then
			acidLevel = acidLevel + .1 
		end
	else
		Citizen.Wait(1000)
	end	
    end
end)
Citizen.CreateThread(function()
    while true do
	if isOn then 
		Citizen.Wait(20000)
		
			if mistakes == 0 then
				table.insert(product, "coke_pooch")
				mistakes = 0	
				--Give some of that good shit
			elseif mistakes < 3 then
				table.insert(product, "crack_pooch")
				mistakes = 0	
				--Give some of the iffy shit
			else
				mistakes = 2
				--They made bullshit
			end
		if ingredLoad - 5 < 0 then
			isOn = false
		else
			ingredLoad = ingredLoad - 5
		end
	else
		Citizen.Wait(1000)
	end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(200)
		if isOn then
			if mistakes > 5 then
				AddExplosion(1005.76, -3199.8, -38.72, 0, 1000.0,1,false,10.0)
				AddExplosion(1014.12, -3195.8, -38.72,0 , 10000.0,1,false,10.0)
				Citizen.Wait(400)
				AddExplosion(1003.37, -3194.8, -38.72, 0, 10000.0,1,false,10.0)
				AddExplosion(997.76, -3200.8, -38.72, 0, 10000.0,1,false,10.0)
				Citizen.Wait(400)
				AddExplosion(1016.01, -3198.8, -38.72, 0, 10000.0,1,false,10.0)
				AddExplosion(1011.89, -3201.08, -38.72,0 , 100000.0,1,false,10.0)
				Citizen.Wait(400)
				AddExplosion(1003.37, -3194.8, -38.72, 0, 10000.0,1,false,10.00)
				AddExplosion(1005.53, -3196.18, -38.72, 0, 10000.0,1,false,10.0)
				Citizen.Wait(400)
				AddExplosion(997.8, -3195.8, -37.00, 0, 10000.0,1,false,10.0)
				AddExplosion(1003.89, -3199.22, -38.72, 0, 1000.0,1,false,10.0)
				Citizen.Wait(400)
				AddExplosion(1009.81, -3195.8, -38.72, 0, 10000.0,1,false,10.0)
				AddExplosion(1008.27, -3200.18, -38.72, 0 , 10000.0,1,false,10.0)
				TriggerServerEvent('esx_addons_gcphone:startCall', 'police', "THERE'S BEEN AN EXPLOSION AT COKE_LABS!", {x = -1146.34, y = 4940.91, z = 222.27})
				isOn = false
				--Explosions
				--Send Alert
			end
				
			if temperature > 150 and acidLevel < 1.5 then 
				mistakes = mistakes + 2
				Citizen.Wait(2500)
				--Send out notifications
			elseif temperature < 60 or acidLevel > 6.0 or temperature > 120 or acidLevel < 2.0 then
				mistakes = mistakes + 1
				Citizen.Wait(2500)
				--Send out notifications
				
			end
		end
	end
end)

RegisterNetEvent('ECoke:start')
AddEventHandler('ECoke:start', function()
	local set = false
	Citizen.Wait(10)
	
	local rnX = Config.PickupBlip.x + math.random(-35, 35)
	local rnY = Config.PickupBlip.y + math.random(-35, 35)
	
	local u, Z = GetGroundZFor_3dCoord(rnX ,rnY ,300.0,0)
	
	

	
	table.insert(locations,{x=rnX, y=rnY, z=Z + 0.3});

	

end)


RegisterNetEvent('ECoke:new')
AddEventHandler('ECoke:new', function(id)
	local set = false
	Citizen.Wait(10)
	
	
	local rnX = Config.PickupBlip.x + math.random(-35, 35)
	local rnY = Config.PickupBlip.y + math.random(-35, 35)
	
	local u, Z = GetGroundZFor_3dCoord(rnX ,rnY ,300.0,0)
	
	locations[id].x = rnX
	locations[id].y = rnY
	locations[id].z = Z + 0.3

end)

RegisterNetEvent('ECoke:message')
AddEventHandler('ECoke:message', function(message)
	ESX.ShowNotification(message)
end)
			
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


