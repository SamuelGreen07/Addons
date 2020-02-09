Exp_ZoneNames = {};
local Exp_Targets = {};
local Exp_TargetsMini = {};
local lastmap="";
local showmissing = true;
ExplorerCoordsConfig = {};
local togather = {42,43,44,45,4868,6974,8935,11188}
local DragonPins = LibStub:GetLibrary("HereBeDragons-Pins-1.0");
local timeractive=false;
local addonloaded=false;
local playerentered=false;
local timerachlist=false;
function ExplorerCoords_OnLoad()
	--if not (ExplorerCoord) then
		--ExplorerCoords_Init();
	 --end
	Exp_ZoneNames[1] = { GetMapZones(1) } ;
	Exp_ZoneNames[2] = { GetMapZones(2) } ;
	Exp_ZoneNames[3] = { GetMapZones(3) } ;
	Exp_ZoneNames[4] = { GetMapZones(4) } ;
	Exp_ZoneNames[5] = { GetMapZones(5) } ;
	Exp_ZoneNames[6] = { GetMapZones(6) } ;
	Exp_ZoneNames[7] = { GetMapZones(7) } ;
	Exp_ZoneNames[8] = { GetMapZones(8) } ;
    ExplorerCoordsFrame:RegisterEvent("ADDON_LOADED");
	ExplorerCoordsFrame:RegisterEvent("PLAYER_LOGIN");
	ExplorerCoordsFrame:RegisterEvent("RECEIVED_ACHIEVEMENT_LIST");
	
	for i=1,30,1 do
	  Exp_Target=CreateFrame("Button", "ExplorerCoordsWorldTargetFrame",WorldMapDetailFrame );
	  Exp_Target:SetWidth(16);
      Exp_Target:SetHeight(16);
	  Exp_Target.icon = Exp_Target:CreateTexture("ARTWORK");
      Exp_Target.icon:SetAllPoints();
	  Exp_Target.icon:SetTexture("Interface\\AddOns\\ExplorerCoords\\images\\coordicon");
	  Exp_Target:SetFrameLevel(10000);
	  Exp_Target:EnableMouse(true);
	  Exp_Target:SetScript("OnEnter", ExplorerCoords_Coord_OnEnter);
	  Exp_Target:SetScript("OnLeave", ExplorerCoords_Coord_OnLeave);
	  Exp_Targets[i]=Exp_Target;
	end
	
	for i=1,30,1 do
	  Exp_TargetMini=CreateFrame("Button", "ExplorerCoordsMinimapTargetFrame",Minimap );
	  Exp_TargetMini:SetWidth(10);
      Exp_TargetMini:SetHeight(10);
	  Exp_TargetMini.icon = Exp_TargetMini:CreateTexture("ARTWORK");
      Exp_TargetMini.icon:SetAllPoints();
	  Exp_TargetMini.icon:SetTexture("Interface\\AddOns\\ExplorerCoords\\images\\coordicon");
	  Exp_TargetMini:SetFrameLevel(10000);
	  Exp_TargetMini:EnableMouse(true);
	  Exp_TargetMini:SetScript("OnEnter", ExplorerCoords_MiniCoord_OnEnter);
	  Exp_TargetMini:SetScript("OnLeave", ExplorerCoords_MiniCoord_OnLeave);
	  Exp_TargetsMini[i]=Exp_TargetMini;
	end
	--GetCurrentMapZone
	
end

function ExplorerCoords_Init()
	
	if not (ExplorerCoord ) or not (ExplorerCoord["v"]) or (ExplorerCoord["v"] ~= 15)  then
		if not(ExplorerCoordTracker) then
			ExplorerCoordTracker = {};
		end
		ExplorerCoord = {};
		for index,value in pairs(ExplorerCoordInit) do 
			for index2,value2 in pairs(value) do 
				
					parentzone=ExplorerCoords_GetZoneName(index,index2);
					ExplorerCoord[parentzone] = {};
					ExplorerCoord[parentzone]["catid"] = index2;
				
				for index3,value3 in pairs(value2) do 
					if(index2 == 868) then
						--ExplorerCoord[parentzone] = {};
					else
						--dirty vashjir hack
						if(index2==48825) then
							local tmp_parentzone=ExplorerCoords_GetZoneName(-1,value3["subz"]);
							if not(ExplorerCoord[tmp_parentzone]) then
								ExplorerCoord[tmp_parentzone] = {};
								ExplorerCoord[tmp_parentzone]["catid"] = index2;
							end
							subzone = ExplorerCoords_GetSubZoneName(index2,index3);
							ExplorerCoord[tmp_parentzone][subzone] = {};
							ExplorerCoord[tmp_parentzone][subzone]["x"] = value3["x"];
							ExplorerCoord[tmp_parentzone][subzone]["y"] = value3["y"];
						else
							
							--print(index2.." - "..index3);
							subzone = ExplorerCoords_GetSubZoneName(index2,index3);
							--print(parentzone.."--"..subzone);
							
							ExplorerCoord[parentzone][subzone] = {};
							ExplorerCoord[parentzone][subzone]["x"] = value3["x"];
							ExplorerCoord[parentzone][subzone]["y"] = value3["y"];
						end
					end
				end
			end
		end
		ExplorerCoord["v"] = {};
		ExplorerCoord["v"] = 16;
		ExplorerCoordInit = nil;
	end
end

function  ExplorerCoords_GetZoneName(zoneindex,zoneid) 
	--dirty vashjir hack
	if(zoneindex==-1) then
		SetMapByID(zoneid);
		print (zoneid);
	else
		SetMapByID(ExplorerCoordMapIt[zoneindex][zoneid]);
	end
	return Exp_ZoneNames[GetCurrentMapContinent()][GetCurrentMapZone()];
	
	--for i=1,GetAchievementNumCriteria(zoneindex),1 do
		--zonename,_,_,_,_,_,_,zoneidingame,_,_=GetAchievementCriteriaInfo(zoneindex,i);
		--DEFAULT_CHAT_FRAME:AddMessage(zoneid);
		--if(zoneid==zoneidingame) then
			--DEFAULT_CHAT_FRAME:AddMessage("hjohoho");
		--	return zonename;
		--end
	--end

end

function  ExplorerCoords_GetSubZoneName(zoneindex,zoneid) 
	for i=1,GetAchievementNumCriteria(zoneindex),1 do
		zonename,_,_,_,_,_,_,zoneidingame,_,_=GetAchievementCriteriaInfo(zoneindex,i);
		--zonename,_,_,_,_,_,_,_,_,zoneidingame=GetAchievementCriteriaInfo(zoneindex,i);
		--DEFAULT_CHAT_FRAME:AddMessage(zoneidingame);
		if(zoneid==zoneidingame) then
			--DEFAULT_CHAT_FRAME:AddMessage("hjohoho");
			return zonename;
		end
	end

end
--local scanned=0;

function ExplorerCoordsGather_ScanForNewDone()
	--scanned=scanned+1;
	for index,value in pairs(ExplorerCoordsGather_Config) do 
		for index2,value2 in pairs(value) do 
			for index3,value3 in pairs(value2) do 
				local _,_,completed=GetAchievementCriteriaInfo(index2,value3);
				if(completed==true) then
					ExplorerCoordsGather_Config[index][index2][index3] = nil;
					ExplorerCoords_UpdateMap("mini");
					ExplorerCoords_UpdateMap("world");
					if not(ExplorerCoordTracker) then
						ExplorerCoordTracker = {};
					end
					if not(ExplorerCoordTracker[index]) then
						ExplorerCoordTracker[index] = {};
					end
					if not(ExplorerCoordTracker[index][index2]) then
						ExplorerCoordTracker[index][index2] = {};
					end
					if not(ExplorerCoordTracker[index][index2][index3]) then
						ExplorerCoordTracker[index][index2][index3] = {};
						local x,y = GetPlayerMapPosition("player");
						ExplorerCoordTracker[index][index2][index3]["x"] = x;
						ExplorerCoordTracker[index][index2][index3]["y"] = y;
					end
					
				end
			end
		
		end	
	end
	timeractive=false;
	--print(scanned);
end

function ExplorerCoords_CheckTracking()
	-- Exp_ZoneNames[GetCurrentMapContinent()][GetCurrentMapZone()]
	--	local checkcounter=0;
	--local zonetext = GetRealZoneText();
	--local dotracking = false;
	--if(ExplorerCoordsGather_Config) then
		
	--	for k,v in pairs(ExplorerCoordsGather_Config) do
			
	--		for k2,v2 in pairs(v) do
	--		    checkcounter=checkcounter+1;		
	--			if(ExplorerCoords_GetZoneName(k,k2)==zonetext) then
	--				dotracking = true;
	--			end
	--		end
		
	--	end
	--end
	if(IsInInstance()==1) then
		dotracking=false;
	else
		dotracking=true;
	end
	if(dotracking==true) then
		ExplorerCoordsFrame:RegisterEvent("ACHIEVEMENT_EARNED");
		ExplorerCoordsFrame:RegisterEvent("CRITERIA_UPDATE");	
		--print("tracking");
	else
		ExplorerCoordsFrame:UnregisterEvent("ACHIEVEMENT_EARNED");
		ExplorerCoordsFrame:UnregisterEvent("CRITERIA_UPDATE");	
		--print("notracking");
	end
	--print(checkcounter);
end
--local inittracker = 0;
function ExplorerCoords_InitTracker()
	--inittracker=inittracker+1;
	ExplorerCoordsGather_Config = {};
	for index,value in pairs(togather) do 
			--print(value);
			--ExplorerCoordsGather_Config[value] = {};
			for i=1,GetAchievementNumCriteria(value) do
				
				local _,_,_,_,_,_,_,achiveid = GetAchievementCriteriaInfo(value,i);
				--ExplorerCoordsGather_Config[value][achiveid] = {};
				for i2=1,GetAchievementNumCriteria(achiveid) do
				
					local _,_,completed,_,_,_,_,zoneidingame,_,_=GetAchievementCriteriaInfo(achiveid,i2);
					if(completed==false) then
						if not(ExplorerCoordsGather_Config[value]) then
							ExplorerCoordsGather_Config[value] = {};
						end
						if not(ExplorerCoordsGather_Config[value][achiveid]) then
							ExplorerCoordsGather_Config[value][achiveid] = {};
						end
						
						ExplorerCoordsGather_Config[value][achiveid][zoneidingame] = i2;
					end
				end
			end

	end
	--f:RegisterEvent("ACHIEVEMENT_EARNED");
	--f:RegisterEvent("CRITERIA_UPDATE");	
	timerachlist=true;
	--print(inittracker);
end

function ExplorerCoords_OnEvent(self,event, ...)
	if ( (event == "WORLD_MAP_UPDATE") and WorldMapFrame:IsVisible() ) then
		ExplorerCoords_UpdateMap("world");
	elseif(event == "ZONE_CHANGED_NEW_AREA") then
		
		if(ExplorerCoords_Config.ShowMiniMap==true) then
			ExplorerCoords_UpdateMap("mini");
			
		end
		if(ExplorerCoords_Config.DoTracking==true) then
			ExplorerCoords_CheckTracking();
		end
		
	elseif(event == "ADDON_LOADED") then
		ExplorerCoordsGather_Config = {};
		local arg1 = ...;
		 
	   if(arg1 == "ExplorerCoords") then
			ExplorerCoords_Init();
			ExplorerCoordsConfig:Init();
			ExplorerCoordsFrame:UnregisterEvent("ADDON_LOADED");
			if(CanShowAchievementUI()) then
				ExplorerCoords_InitTracker();
			end
			ExplorerCoords_OnEvent("blah","ZONE_CHANGED_NEW_AREA");
			addonloaded=true;
			ExplorerCoords_CheckGuid();
		end
			if not ExplorerCoords_Config["lastcheck"] then
				ExplorerCoords_Config["lastcheck"] = time();
			end
			if(time()-ExplorerCoords_Config["lastcheck"]>604800) then
				C_Timer.After(20,function() print("|c0000FF00Explorer Coords|r:"..EXPLORER_COORD_DISCOVERED_HELP);ExplorerCoords_Config["lastcheck"] = time(); end);
				
			end
		
		
	elseif(event == "RECEIVED_ACHIEVEMENT_LIST") then
		if(CanShowAchievementUI() and timerachlist==false) then
			
			C_Timer.After(20,ExplorerCoords_InitTracker);
			timerachlist=true;
		end
	elseif(event=="ACHIEVEMENT_EARNED" or event=="CRITERIA_UPDATE") then
		if(timeractive==false) then
			timeractive=true;
			C_Timer.After(1,ExplorerCoordsGather_ScanForNewDone);
			
		end
	
	elseif(event=="PLAYER_LOGIN") then
		playerentered=true;
		ExplorerCoords_CheckGuid();
	end
end

function ExplorerCoords_CheckGuid()
	if(playerentered==true and addonloaded==true and not ExplorerCoords_Config.guid) then
		ExplorerCoords_Config.guid = UnitGUID("player");
	end
	
end

local function GetZoneInfo(zonename)
	for i=1,8,1 do
		for index,value in pairs(Exp_ZoneNames[i]) do
			if (value == zonename) then
				return i,index;
			end
		end
	end

end

function ExplorerCoords_ClearNotes(whichmap)
	if(whichmap == "world") then
	
		for i=1,30,1 do
			Exp_Target = Exp_Targets[i];
			Exp_Target:Hide();
		end
	elseif(whichmap == "mini") then
		for i=1,30,1 do
			Exp_TargetMini = Exp_TargetsMini[i];
			Exp_TargetMini:Hide();
		end
	end
end

function ExplorerCoords_UpdateMap(whichmap)
	ExplorerCoords_ClearNotes(whichmap);
	--temp until legion is added
	--if(GetCurrentMapContinent()==8) then
	--	return
	--end
	if(whichmap=="world" and GetCurrentMapZone()<1) then
	  return;
	end  
	  if(whichmap == "world") then
		--print(GetCurrentMapZone())
		currentzone = Exp_ZoneNames[GetCurrentMapContinent()][GetCurrentMapZone()];
		
	  elseif(whichmap == "mini") then
		SetMapToCurrentZone();
		if(GetCurrentMapContinent()==nil or GetCurrentMapZone()==nil) then
			return;
		end
		--print(Exp_ZoneNames);
		if (not Exp_ZoneNames or not Exp_ZoneNames[GetCurrentMapContinent()] or not Exp_ZoneNames[GetCurrentMapContinent()][GetCurrentMapZone()]) then
			return;
		end
		currentzone = Exp_ZoneNames[GetCurrentMapContinent()][GetCurrentMapZone()];
		--print(currentzone);
	  end
	 
	  if( ExplorerCoord[currentzone]) then
	    if(whichmap == "world") then
			if(lastmap==currentzone) then
				showmissing = false;
			else
				showmissing = true;
				lastmap = currentzone;
			end;
		end
		--sprint(currentzone);
	    catid = ExplorerCoord[currentzone]["catid"];
		--fuckup here still
		if(catid==868) then
			return;
		end
		
	    for i=1,GetAchievementNumCriteria(catid),1 do
	      criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, unknown = GetAchievementCriteriaInfo(catid, i);
	      
		  if(completed) then
	      
	      else
		    if(ExplorerCoord[currentzone][criteriaString]) then
			  if(ExplorerCoord[currentzone][criteriaString]["x"]~=-1) then
			    coordx = ExplorerCoord[currentzone][criteriaString]["x"];
	            coordy = ExplorerCoord[currentzone][criteriaString]["y"];
			  
			    if(whichmap == "world") then
				  Exp_Target = Exp_Targets[i];
			      Exp_Target.id = criteriaString;
	              Exp_Target:Show();
				  DragonPins:AddWorldMapIconMF( WorldMapDetailFrame, Exp_Target, GetCurrentMapAreaID(), GetCurrentMapDungeonLevel(), coordx, coordy );
			    elseif(whichmap == "mini") then
				  if(ExplorerCoords_Config.ShowMiniMap == false) then
					return
				  end
				  Exp_TargetMini = Exp_TargetsMini[i];
				  Exp_TargetMini.id = criteriaString;
				  Exp_TargetMini:Show();
				  mini_continent, mini_zone = GetZoneInfo(currentzone);
				  SetMapToCurrentZone();
				  DragonPins:AddMinimapIconMF(Minimap, Exp_TargetMini, GetCurrentMapAreaID(),GetCurrentMapDungeonLevel(), coordx, coordy, true );
			    end
			  else
			  
			    if(showmissing and whichmap == "world" and (not ExplorerCoords_Config.ShowMissingCoords or ExplorerCoords_Config.ShowMissingCoords==false)) then
				  DEFAULT_CHAT_FRAME:AddMessage("Explorer Coords: Missing coords for "..criteriaString);
			    end
			  end
			end
			--else
			-- if(showmissing and whichmap == "world") then
			--	DEFAULT_CHAT_FRAME:AddMessage("Explorer Coords: Missing coords for "..criteriaString);
			-- end
			--end
	      end
	    end
	  end
	
	
end

function ExplorerCoords_MiniCoord_OnEnter(frame,this)
  
  local tooltip = GameTooltip;
  tooltip:SetOwner(frame, "ANCHOR_BOTTOMLEFT")
  tooltip:ClearLines()
  tooltip:AddLine(frame.id);
  tooltip:Show();

end

function ExplorerCoords_MiniCoord_OnLeave()
  GameTooltip:Hide();
end

function ExplorerCoords_Coord_OnEnter(frame,this)
  WorldMapPOIFrame.allowBlobTooltip = false;
  local tooltip = WorldMapTooltip;
  tooltip:SetOwner(frame, "ANCHOR_BOTTOMLEFT")
  tooltip:ClearLines()
  tooltip:AddLine(frame.id);
  tooltip:Show();

end

function ExplorerCoords_Coord_OnLeave()
  WorldMapPOIFrame.allowBlobTooltip = true;
  WorldMapTooltip:Hide();
end