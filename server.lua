mysql = exports.mysql
-- if not getElementData(source, "jammerE") then else return  outputChatBox("[!] #f0f0f0Sinyal yok.", source, 255, 0, 0, true) end
-- bu üsteki kodu sinyalini kesmek istediğin fonskyionun altına koy



local kuruldu = {}
local isik = {}
local joseph = {}

-- made by joseph & legend:creation.

function createJammer(thePlayer, command )
	local logged = getElementData(thePlayer, "loggedin")
	if not (logged==1) then return end
	local rotation = getElementRotation( thePlayer )
	local interior = getElementInterior( thePlayer )		

	-- if not (exports.global:hasItem(thePlayer, 279)) then -- oyuncu jammera sahip mi?
		-- return outputChatBox("[!] #ffffffÖnce bir jammeri satın alın.", thePlayer, 255, 0, 0, true)
	-- end

	-- if allowedkuruldu[JammerID][1] then
		if not kuruldu[thePlayer] then
			if isPedInVehicle(thePlayer) then return false end
			local x, y, z = getPositionInfront(thePlayer)
			local rotX, rotY, rotZ = getElementRotation(thePlayer)
			local dimension = getElementDimension(thePlayer)

			-- creating object..
			local objectID = 1481
			local element = createObject(3031, x-0.30, y, z-0.10, 0, 0, 270)
			if not element then return outputChatBox("[!] #ffffffJammer kurulamadı, tekrar deneyin.", thePlayer, 0, 255, 0, true) end
			-- dimension
			setElementDimension(element, dimension)
			setElementData(element, "scale", 0.1)
			
			-- made by joseph & legend:creation.
			-- Jammer id
			local id = getJammerID()
			local text = createElement("text")
			setElementPosition(text, x, y, z+0.20)
			setElementData(text, "scale", 1.2)
			setElementData(text, "text", "#C5C803[Jammer Aleti]\n#C5C803Komut: #FFFFFF''/jammer calistir/kapat''")
			setElementInterior( text, interior )
			setElementDimension( text, dimension )
		

						kuruldu[thePlayer] = {element = element, text = text}


			setElementData(element, "owner", thePlayer)
			setElementInterior( element, interior )
		   setElementDimension( element, dimension )
		else
			outputChatBox("[!] #ffffffÖnce kurduğunuz jammeri kaldırmanız gerekiyor. (/jammerkaldir)", thePlayer, 255, 0, 0, true)
		end
	end
-- end
addCommandHandler("jammerkurlan", createJammer)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------

addCommandHandler("jammer", function (thePlayer,cmd, komut)
if not komut then
    outputChatBox("Sözdimizi:#ffffff "..cmd.." [calistir/kapat]", thePlayer, 255, 194, 14, true)
	return end
	
	
	if (not getElementData(thePlayer, "jammerE")) then
		if komut == "calistir" then
	if kuruldu[thePlayer] then
			if not isPlayerNearObject(thePlayer, kuruldu[thePlayer].element) then 
			return outputChatBox("[!] #ffffffÖnce jammerinizin yanına gidin.", thePlayer, 255, 0, 0, true)
		end
		
	-- if (not getElementData(thePlayer, "jamerAc")) then
		
	-- made by joseph & legend:creation.
	local x, y, z = getElementPosition ( kuruldu[thePlayer].element )
	local rx, ry, rz = getElementRotation(kuruldu[thePlayer].element )
	  
	  		local marker = nil
	  
		-- setPedAnimation(thePlayer,"CASINO", "Roulette_bet")
		setElementData(thePlayer, "jammerE", true)
		exports.global:applyAnimation(thePlayer, "CASINO", "dealone", -1, true, false, false, false)
		setElementFrozen(thePlayer, true) 
		
	  
	          local alanJ = createColRectangle ( x-40, y-40, 80, 80 ) 
			  
addEventHandler ( "onColShapeHit", alanJ, function ( thePlayer, matchingDimension )
        if getElementType ( thePlayer ) == "player" then 
		setElementData(thePlayer, "jammerE", true)
							-- exports.mysql:query_free("UPDATE `characters` SET `jammer`='2' WHERE `id`='"..mysql:escape_string(getElementData(thePlayer, "dbid")).."' ")
radyoKapat(thePlayer)
		
		

        end
end)	          

addEventHandler ( "onColShapeLeave", alanJ, function ( thePlayer, matchingDimension )
        if getElementType ( thePlayer ) == "player" then 
		setElementData(thePlayer, "jammerE", false)
							-- exports.mysql:query_free("UPDATE `characters` SET `jammer`='1' WHERE `id`='"..mysql:escape_string(getElementData(thePlayer, "dbid")).."' ")
radyoKapat(thePlayer)
		
		
-- made by joseph & legend:creation.
        end
end)
	for _,v in ipairs (getElementsByType("player")) do
    	if  isElementWithinColShape( v, alanJ ) then 
		setElementData(v, "jammerE", true)
	-- exports.mysql:query_free("UPDATE `characters` SET `jammer`='2' WHERE `id`='"..mysql:escape_string(getElementData(v, "dbid")).."' ")
	radyoKapat(v)
    end
    end




 joseph[thePlayer] = {alanJ = alanJ}


		outputChatBox("[!] #ffffffJammeri çalıştırıyorsun, Lütfen 1 dakika bekleyin!", thePlayer, 10, 10, 255, true)
				setTimer(function(thePlayer) 
					local x, y, z = getElementPosition ( kuruldu[thePlayer].element )
	local rx, ry, rz = getElementRotation(kuruldu[thePlayer].element )
	  local marker = nil
						exports.global:sendLocalDoAction(thePlayer, "Jammer çalıştı", false, true)
						outputChatBox("[!] #ffffffJammer çalıştı ve sinyaller kesildi!", thePlayer, 10, 10, 255, true)
						     marker = createMarker(x, y, z, "corona", 1, 255, 0, 0, 150)
							 isik[thePlayer] = {marker = marker, alanJ = alanJ}
					end, 5000, 1, thePlayer)	
	  -- made by joseph & legend:creation.
	  				setTimer(function(thePlayer) 
					setElementFrozen(thePlayer, false)
					exports.global:removeAnimation(thePlayer)
					end, 5000, 1, thePlayer)

	  
	
else
outputChatBox("[!] #ffffffZaten Jammer çalışıyor", thePlayer, 10, 10, 255, true)
	end
end
end


	if komut == "kapat" then
			if not isPlayerNearObject(thePlayer, kuruldu[thePlayer].element) then 
			return outputChatBox("[!] #ffffffÖnce jammerinizin yanına gidin.", thePlayer, 255, 0, 0, true)
		end
	setElementData(thePlayer, "jammerE", false)
		outputChatBox("[!] #ffffffJammer Kapanıyor, Bekleyiniz", thePlayer, 10, 10, 255, true)
		
					setTimer(function(thePlayer)
						exports.global:sendLocalDoAction(thePlayer, "Jammer kapandı", false, true)
						outputChatBox("[!] #ffffffJammer Kapandı", thePlayer, 10, 10, 255, true)
					end, 5000, 1, thePlayer)						
		setTimer ( destroyElement, 5000, 1, isik[thePlayer].marker ) 
		setTimer ( destroyElement, 5000, 1, isik[thePlayer].alanJ ) 

 
	for _,vv in ipairs (getElementsByType("player")) do
    	if  isElementWithinColShape( vv, joseph[thePlayer].alanJ ) then 
	-- exports.mysql:query_free("UPDATE `characters` SET `jammer`='1' WHERE `id`='"..mysql:escape_string(getElementData(vv, "dbid")).."' ")
	setElementData(vv, "jammerE", false)
	radyoKapat(vv)

    end
    end

		-- made by joseph & legend:creation.
		
	end
	
	
	
	
	-- else
	-- outputChatBox("[!] #ffffffJammer zaten açık.", thePlayer, 10, 10, 255, true)
-- end
end
)
-- made by joseph & legend:creation.

function getJammerID()
	local id = 1
	if type(kuruldu) == "table" then
		id = #kuruldu + 1
	end
	return id
end


------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

function kaldirJammer(thePlayer)
	if kuruldu[thePlayer] then
		if not isPlayerNearObject(thePlayer, kuruldu[thePlayer].element) then 
			return outputChatBox("[!] #ffffffÖnce jammerinizin yanına gidin.", thePlayer, 255, 0, 0, true)
		end
		if isElement(kuruldu[thePlayer].element) then
			destroyElement(kuruldu[thePlayer].element)
		end
		if isElement(kuruldu[thePlayer].text) then
			destroyElement(kuruldu[thePlayer].text)
		end
		kuruldu[thePlayer] = nil
		outputChatBox("[!] #ffffffJammeri kaldırdınız.", thePlayer, 0, 255, 0, true)
		setElementData(thePlayer, "jammerE", false)
	end
	if isik[thePlayer] then
			if isElement(isik[thePlayer].marker) then
			destroyElement(isik[thePlayer].marker)
		end
		if isElement(isik[thePlayer].alanJ) then
			destroyElement(isik[thePlayer].alanJ)
		end
		
			for _,vv in ipairs (getElementsByType("player")) do
    	if  isElementWithinColShape( vv, isik[thePlayer].alanJ ) then 
	setElementData(vv, "jammerE", false)
	radyoKapat(vv)

    end
    end
	
	end
	-- made by joseph & legend:creation.
end
addCommandHandler("jammerkaldir", kaldirJammer)
-- events
addEventHandler("onPlayerWasted", root, kaldirJammer)
addEventHandler("onPlayerLogout", root, kaldirJammer)
addEventHandler("onPlayerQuit", root, kaldirJammer)


------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
function radyoKapat(thePlayer, commandName, slot)
	if (exports.global:hasItem(thePlayer, 6)) then
		local slot = tonumber( slot )
		local items = exports['items']:getItems(thePlayer)
		local titemValue = false
		local count = 0
		for k, v in ipairs( items ) do
			if v[1] == 6 then
				if slot then
					count = count + 1
					if count == slot then
						titemValue = v[2]
						break
					end
				else
					titemValue = v[2]
					break
				end
			end
		end

		-- gender switch for /me

		if titemValue < 0 then
			outputChatBox("Radio Sinyal açıldı.", thePlayer, 255, 194, 14)
		else
			outputChatBox("Radio Sinyal kesildi.", thePlayer, 255, 194, 14)
		end

		local count = 0
		for k, v in ipairs( items ) do
			if v[1] == 6 then
				if slot then
					count = count + 1
					if count == slot then
						exports['items']:updateItemValue(thePlayer, k, ( titemValue < 0 and 1 or -1 ) * math.abs( v[2] or 1))
						break
					end
				else
					exports['items']:updateItemValue(thePlayer, k, ( titemValue < 0 and 1 or -1 ) * math.abs( v[2] or 1))
				end
			end
		end	
		end
end
-- made by joseph & legend:creation.

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

function isPlayerNearObject(thePlayer, object)
	local pX, pY, pZ = getElementPosition(object)
	local oX, oY, oZ = getElementPosition(thePlayer)
	local distance = getDistanceBetweenPoints3D(pX, pY, pZ, oX, oY, oZ)
	if ( distance < 3 ) then
		return true
	end
	return false
end

function isPlayerNearObjecte(thePlayer, object)
	local pX, pY, pZ = getElementPosition(object)
	local oX, oY, oZ = getElementPosition(thePlayer)
	local distance = getDistanceBetweenPoints3D(pX, pY, pZ, oX, oY, oZ)
	if ( distance < 20 ) then
		return true
	end
	return false
end


function getPositionInfront(element, ates)
	local x, y, z = getElementPosition ( element, ates )
	local a,b,r = getElementRotation ( element, ates )
	local x = x - math.sin ( math.rad(r) ) * 0.9
	local y = y + math.cos ( math.rad(r) ) * 0.9
	return x,y,z
end

---------------------------------------------------------------------------------
--------Auro Jammer ALMA-------------------------------------------------
---------------------------------------------------------------------------------
local almayeri = createColSphere (   2801.1669921875, -2417.44921875, 13.630395889282, 3, 1779)
addCommandHandler("satinal",
function(thePlayer, cmd, jammer)
if isElementWithinColShape(thePlayer, almayeri) then
if jammer == "jammer" then
	local faction = getPlayerTeam(thePlayer)
	local factionType = getElementData(faction, "type")
    -- if (factionType == 0) or (factionType == 1) then
	    local para = 25000
				if exports.global:takeMoney(thePlayer, para) then
					outputChatBox("[!] #f0f0f0Bir Adet jammer satın aldınız.", thePlayer, 0, 255, 0, true)
					exports["items"]:giveItem(thePlayer, 273, 500) 
				else
					outputChatBox("[!] #f0f0f0Yeterli paranız bulunmamaktadır. Ücret: "..para, thePlayer, 255, 0, 0, true)
				end
										-- else
		-- outputChatBox("Bu İşlemi Yapmak İçin İlegal Birliğinde Olmanız Lazım", thePlayer, 255, 0, 0, true)
				-- end
		end
	end
end	)
-- made by joseph & legend:creation.