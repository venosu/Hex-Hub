--[[

SUP HTTPSPY USER, idc if you'll get source of this and use it for your scripts or anything,
just please dont leak this lol

Ideas:
--]]

print("Hex Hub | Initializing...")

if not getrawmetatable or not getsenv or not readfile or not writefile then game.Players.LocalPlayer:Kick("Exploit not supported!") end

local UserInputService = game:GetService("UserInputService")
local cbClient = getsenv(game.Players.LocalPlayer.PlayerGui.Client)
local mouse = game.Players.LocalPlayer:GetMouse()
local library = loadstring(game:HttpGet("https://pastebin.com/raw/qtYkNkmC", true))()

local RageTab = library:CreateWindow('Rage') --                         █ Rage Tab                                        

local s = RageTab:Slider("DMG Multiplier", {
	min = 1;
	max = 10;
	flag = 'dmgmulti'
}, function(v)
	RageTab.flags.dmgmulti = v;
	print(RageTab.flags.dmgmulti)
end)

local t = RageTab:Toggle('Kill All', {flag = "toggle2"})
_G.stoploopkill = false
local b = RageTab:Button("Reset Loop Kill", function()
	_G.stoploopkill = true
	wait(1)
	_G.stoploopkill = false
end)

local VisualTab = library:CreateWindow('Visual') --                     █ Visuals Tab    

VisualTab:Section('Camera Effects')

VisualTab:Dropdown("Weapons Mode", {
	flag = "WeaponsMode";
	list = {
		"Normal";
		'Invisible';
		"Rainbow";
	}
}, function(new)
	print(VisualTab.flags.WeaponsMode)
end)

VisualTab:Dropdown("Gloves Mode", {
	flag = "GlovesMode";
	list = {
		"Normal";
		'Invisible';
		"Rainbow";
	}
}, function(new)
	print(VisualTab.flags.GlovesMode)
end)

VisualTab:Dropdown("Arms Mode", {
	flag = "ArmsMode";
	list = {
		"Normal";
		'Invisible';
		"Rainbow";
	}
}, function(new)
	print(VisualTab.flags.ArmsMode)
end)

local s = VisualTab:Slider("FOV", {
	min = math.floor(workspace.CurrentCamera.FieldOfView);
	max = 120;
	flag = 'fov'
}, function(v)
	getsenv(game.Players.LocalPlayer.PlayerGui.Client).fieldofview = v;
	workspace.CurrentCamera.FieldOfView = v;
end)

local t = VisualTab:Toggle('Third Person', {flag = "thirdp"})

local s = VisualTab:Slider("Third Person Dist.", {
	min = 1;
	max = 30;
	flag = 'tpd' 
}, function(v)
end)

local t = VisualTab:Toggle('No Flash', {flag = "toggle"}, function(enabled)
	if enabled == true then
		game.Players.LocalPlayer.PlayerGui.Blnd.Enabled = false
	else
		game.Players.LocalPlayer.PlayerGui.Blnd.Enabled = true
	end
end)

local t = VisualTab:Toggle('No Smoke', {flag = "toggle"}, function(enabled)
	if enabled == true then
		game:GetService("RunService"):BindToRenderStep("NoSmokes", 100, function()
			for i,v in pairs(game.Workspace["Ray_Ignore"].Smokes:GetChildren()) do
				if v:IsA("Part") then
					v:Destroy()
				end
			end
		end)
	else
		game:GetService("RunService"):UnbindFromRenderStep("NoSmokes")
	end
end)   
--[[
local t = VisualTab:Toggle('Old M4A1 Model', {flag = "toggle"}, function(enabled)
	if enabled == true then
		game.ReplicatedStorage.Viewmodels["v_M4A1"]:Destroy()
		local newgun = game.ReplicatedStorage.Viewmodels.OldM4A1BACKUP:Clone()
		newgun.Name = "v_M4A1"
		newgun.Parent = game.ReplicatedStorage.Viewmodels
	else
		game.ReplicatedStorage.Viewmodels["v_M4A1"]:Destroy()
		local newgun = game.ReplicatedStorage.Viewmodels.M4A1BACKUP:Clone()
		newgun.Name = "v_M4A1"
		newgun.Parent = game.ReplicatedStorage.Viewmodels
	end
end)

local t = VisualTab:Toggle('Halloween C4 Model', {flag = "toggle"}, function(enabled)
	if enabled == true then
		game.ReplicatedStorage.Viewmodels["v_C4"]:Destroy()
		local newgun = game.ReplicatedStorage.Viewmodels.HalloweenC4BACKUP:Clone()
		newgun.Name = "v_C4"
		newgun.Parent = game.ReplicatedStorage.Viewmodels
	else
		game.ReplicatedStorage.Viewmodels["v_C4"]:Destroy()
		local newgun = game.ReplicatedStorage.Viewmodels.C4BACKUP:Clone()
		newgun.Name = "v_C4"
		newgun.Parent = game.ReplicatedStorage.Viewmodels
	end
end)  

local oldm4a1backup = game.ReplicatedStorage.Viewmodels["v_oldM4A1-S"]:Clone()
oldm4a1backup.Parent = game.ReplicatedStorage.Viewmodels
oldm4a1backup.Name = "OldM4A1BACKUP"

oldm4a1backup.Silencer.Transparency = 1
local fix = oldm4a1backup.Silencer:Clone()
fix.Parent = oldm4a1backup
fix.Name = "Silencer2"
fix.Transparency = 0

local m4a1backup = game.ReplicatedStorage.Viewmodels["v_M4A1"]:Clone()
m4a1backup.Parent = game.ReplicatedStorage.Viewmodels
m4a1backup.Name = "M4A1BACKUP"

local halloweenC4backup = game.ReplicatedStorage.Viewmodels["v_C4Halloween"]:Clone()
halloweenC4backup.Parent = game.ReplicatedStorage.Viewmodels
halloweenC4backup.Name = "HalloweenC4BACKUP"

local C4backup = game.ReplicatedStorage.Viewmodels["v_C4"]:Clone()
C4backup.Parent = game.ReplicatedStorage.Viewmodels
C4backup.Name = "C4BACKUP"
--]]
VisualTab:Section('ESP')

local t = VisualTab:Toggle('ESP', {flag = "ESPtoggle"})

local t = VisualTab:Toggle('Free for All', {flag = "ESPFFAtoggle"})

local t = VisualTab:Toggle('Spectators List', {flag = "toggle"}, function(enabled)
	if enabled == true then
		game.CoreGui:WaitForChild("SpectatorsList").Enabled = true
	else
		game.CoreGui:WaitForChild("SpectatorsList").Enabled = false
	end
end) 

local MiscTab = library:CreateWindow('Miscellaneous') --                █ Misc Tab 

local t = MiscTab:Toggle('Inf Cash', {flag = "toggle"}, function(enabled)
	if enabled == true then
		local oldcash = game.Players.LocalPlayer.Cash.Value
		game:GetService("RunService"):BindToRenderStep("InfCash", 100, function()
			game.Players.LocalPlayer.Cash.Value = 9999
			game.Players.LocalPlayer.PlayerGui.GUI.Cash.Text = "$∞"
		end)
	else
		game:GetService("RunService"):UnbindFromRenderStep("InfCash")
		wait()
		game.Players.LocalPlayer.Cash.Value = oldcash
	end
end)      

local t = MiscTab:Toggle('Backtrack', {flag = "togglebacktrack"})

local s = MiscTab:Slider("Backtrack MS", {
	min = 1;
	max = 1000;
	flag = 'btt'
})

MiscTab:Section('Movement')

local t = MiscTab:Toggle('Bunny Hop', {flag = "toggle"}, function(enabled)
	if enabled == true then
		game:GetService("RunService"):BindToRenderStep("BunnyHop", 100, function()
			pcall(function()
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) and game.Players.LocalPlayer.Character.Humanoid.Jumping then
					for _, v in pairs(game.ReplicatedStorage.HUInfo:GetChildren()) do
						v.WalkSpeed.Value = 999
					end
					game.Players.LocalPlayer.Character.Humanoid.Jump = true
				else
					for _, v in pairs(game.ReplicatedStorage.HUInfo:GetChildren()) do
						v.WalkSpeed.Value = v.WalkSpeed.ORIGINALVALUE.Value
					end
				end
			end)
		end)
	else
		game:GetService("RunService"):UnbindFromRenderStep("BunnyHop")
	end
end)  

local t = MiscTab:Toggle('No Slowdown', {flag = "toggle"}, function(enabled)
	if enabled == true then
		for _, v in pairs(game.ReplicatedStorage.HUInfo:GetChildren()) do
			v.WalkSpeed.Value = 999
		end
	else
		for _, v in pairs(game.ReplicatedStorage.HUInfo:GetChildren()) do
			v.WalkSpeed.Value = v.WalkSpeed.ORIGINALVALUE.Value
		end
	end
end)

local t = MiscTab:Toggle('No Crouch Cooldown', {flag = "toggle"}, function(enabled)
	if enabled == true then
		game:GetService("RunService"):BindToRenderStep("NoCrouchCooldown", 100, function()
			cbClient.crouchcooldown = 0
		end)
	else
		game:GetService("RunService"):UnbindFromRenderStep("NoCrouchCooldown")
	end
end)  

MiscTab:Dropdown("Teleport", {
	location = _G;
	flag = "HHtpLocation";
	list = {
		"Spawn T";
		"Spawn CT";
		'Bombsite A';
		'Bombsite B';
		'Hostage';
	}
}, function(new)
if _G.HHtpLocation == "Spawn T" then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.SpawnPoints.BuyArea.CFrame
elseif _G.HHtpLocation == "Spawn CT" then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.SpawnPoints.BuyArea2.CFrame
elseif _G.HHtpLocation == "Bombsite A" then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.SpawnPoints.C4Plant2.CFrame + Vector3.new(0,3,0)
elseif _G.HHtpLocation == "Bombsite B" then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.SpawnPoints.C4Plant.CFrame + Vector3.new(0,3,0)
elseif _G.HHtpLocation == "Hostage" then
	
end
end)

MiscTab:Bind("Teleport Key", {
	flag = "tpbind";
	kbonly = true;
	default = nil;--Enum.KeyCode.G;
}, function()
	local pos = mouse.Hit + Vector3.new(0,2.5,0)
	pos = CFrame.new(pos.X, pos.Y, pos.Z)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)

MiscTab:Bind("Fly Key", {
	flag = "flybind";
	kbonly = true;
	default = nil; --Enum.KeyCode.G;
}, function()
	if isflying then
		isflying = false
		StopFLY()
	else
		isflying = true
		StartFLY()
	end
end)

MiscTab:Slider("Fly Speed", {
	min = 1;
	max = 10;
	flag = 'flyspeed'
}, function(v)
	flyspeed = v;
end)

local b = MiscTab:Button("Remove Clips", function()
	local Clips = game.Workspace.Map.Clips
	Clips.Name = "FAT"
	Clips.Parent = nil
	for i,v in pairs(Clips:GetChildren()) do
		if v:IsA("Part") or v:IsA("WedgePart") and v.Name == "CLIP" then
			v.Transparency = 0.8
			v:Remove()
		end
	end
	wait()
	Clips.Name = "Clips"
	Clips.Parent = game.Workspace.Map
end)

local b = MiscTab:Button("Remove Killing Clips", function()
	local Killers = game.Workspace.Map.Killers
	Killers.Name = "FAT"
	Killers.Parent = nil
	for i,v in pairs(Killers:GetChildren()) do
		if v:IsA("Part") or v:IsA("WedgePart") and v.Name == "CLIP" then
			v.Transparency = 0.8
			v:Remove()
		end
	end
	wait()
	Killers.Name = "Killers"
	Killers.Parent = game.Workspace.Map
end)

MiscTab:Section('Special')

local b = MiscTab:Button("Unlock Selected Skins", function()
	--loadstring(game:HttpGet(('https://pastebin.com/raw/MuTGBse4'),true))()
	loadstring(game:HttpGet(('https://pastebin.com/raw/gV3gQrM3'),true))()
end)

local b = MiscTab:Button("Server Rejoin", function()
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

local b = MiscTab:Button("Crash Server", function()
	if game.Players.LocalPlayer.Character then
		game.Workspace.CurrentCamera.CameraType = "Fixed"
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 9999, 0)
		wait()
		game:GetService("RunService").RenderStepped:Connect(function()
			game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(game:GetService("ReplicatedStorage").Weapons["Molotov"].Model, nil, 25, 35, Vector3.new(0,-100,0), nil, nil)
			game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(game:GetService("ReplicatedStorage").Weapons["HE Grenade"].Model, nil, 25, 35, Vector3.new(0,-100,0), nil, nil)
			game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(game:GetService("ReplicatedStorage").Weapons["Decoy Grenade"].Model, nil, 25, 35, Vector3.new(0,-100,0), nil, nil)
			game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(game:GetService("ReplicatedStorage").Weapons["Smoke Grenade"].Model, nil, 25, 35, Vector3.new(0,-100,0), nil, nil)
			game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(game:GetService("ReplicatedStorage").Weapons["Flashbang"].Model, nil, 25, 35, Vector3.new(0,-100,0), nil, nil)
		end)
	end
end)

local b = MiscTab:Button("Copy Discord Invite", function()
	setclipboard("https://discord.gg/uySBpqD")
end)

local TrollingTab = library:CreateWindow('Trolling') --                █ Trolling Tab    

TrollingTab:Section('Chat')

local t = TrollingTab:Toggle('Spam Chat', {flag = "toggle3"})

local box = TrollingTab:Box('Message', {
	flag = "msg";
	type = 'string';
}, function(new, old, enter)
	print(new, old, enter)
	--RageTab.flags.msg = tonumber(new)
end)

local t = TrollingTab:Toggle('Is Team Chat', {flag = "toggle4"})
local t = TrollingTab:Toggle('Is Dead Chat', {flag = "toggle5"})

TrollingTab:Section('Other')

local b = TrollingTab:Button("Give Discombobulator", function()
	game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons.Discombobulator, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame, 0, 0, false, game.Players.LocalPlayer, false, false)
end)

local b = TrollingTab:Button("Give C4", function()
	game.ReplicatedStorage.Events.Drop:FireServer(game.ReplicatedStorage.Weapons.C4, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame, 0, 0, false, game.Players.LocalPlayer, false, false)
end)

local GunModsTab = library:CreateWindow('GunMods') --                █ Gun Mods Tab   

local t = GunModsTab:Toggle('No Recoil', {flag = "toggle"}, function(enabled)
	if enabled == true then
		game:GetService("RunService"):BindToRenderStep("NoRecoil", 100, function()
			cbClient.resetaccuracy()
			cbClient.RecoilX = 0
			cbClient.RecoilY = 0
		end)
	else
		game:GetService("RunService"):UnbindFromRenderStep("NoRecoil")
	end
end)

local t = GunModsTab:Toggle('No Spread', {flag = "toggle"}, function(enabled)
	if enabled == true then
		for i,v in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
			if v.Name == "Spread" then
				v.Value = 0
				for i,c in pairs(v:GetChildren()) do
					c.Value = 0
				end
			end
		end
	else
		for i,v in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
			if v.Name == "Spread" then
				v.Value = v.ORIGINALVALUE.Value
				for i,c in pairs(v:GetChildren()) do
					c.Value = c.ORIGINALVALUE.Value
				end
			end
		end
	end
end)

local t = GunModsTab:Toggle('Rapid Fire', {flag = "toggle"}, function(enabled)
	if enabled == true then
		ModGun(true, "FireRate", 0.001)
	else
		ModGun(false, "FireRate", 0.001)
	end
end)

local t = GunModsTab:Toggle('Full Auto', {flag = "toggle"}, function(enabled)
	if enabled == true then
		ModGun(true, "Auto", true)
	else
		ModGun(false, "Auto", true)
	end
end)

local t = GunModsTab:Toggle('Instant Reload', {flag = "toggle"}, function(enabled)
	if enabled == true then
		ModGun(true, "ReloadTime", 0.001)
	else
		ModGun(false, "ReloadTime", 0.001)
	end
end)

local t = GunModsTab:Toggle('Instant Equip', {flag = "toggle"}, function(enabled)
	if enabled == true then
		ModGun(true, "EquipTime", 0.001)
	else
		ModGun(false, "EquipTime", 0.001)
	end
end)

local t = GunModsTab:Toggle('Inf Ammo', {flag = "toggle"}, function(enabled)
	if enabled == true then
		ModGun(true, "Ammo", 999999)
		ModGun(true, "StoredAmmo", 999999)
		game:GetService("RunService"):BindToRenderStep("InfAmmo", 100, function()
			cbClient.primarystored = 999999
			cbClient.secondarystored = 999999
		end)
	else
		ModGun(false, "Ammo", 999999)
		ModGun(false, "StoredAmmo", 999999)
		game:GetService("RunService"):UnbindFromRenderStep("InfAmmo")
	end
end)

local t = GunModsTab:Toggle('Inf Range', {flag = "toggle"}, function(enabled)
	if enabled == true then
		ModGun(true, "Range", 9999)
	else
		ModGun(false, "Range", 9999)
	end
end)

local t = GunModsTab:Toggle('Inf Penetration', {flag = "toggle"}, function(enabled)
	if enabled == true then
		ModGun(true, "ArmorPenetration", 100)
		ModGun(true, "Penetration", 999999)
	else
		ModGun(false, "ArmorPenetration", 100)
		ModGun(false, "Penetration", 999999)
	end
end)

GunModsTab:Section('C4 Mods')

local t = GunModsTab:Toggle('Plant Anywhere', {flag = "toggleplantanywhere"})

local BypassesTab = library:CreateWindow('Bypasses') --                █ Bypasses Tab   

local t = BypassesTab:Toggle('Anti Fire', {flag = "toggleAFire"})

local t = BypassesTab:Toggle('Anti Fall', {flag = "toggleAFall"})

function PlantC4()
    if not game.Players.LocalPlayer.Character then return end
	if not game.Workspace.Map.Gamemode.Value == "defusal" then return end
	local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	game.Workspace.CurrentCamera.CameraType = "Fixed"
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.SpawnPoints.C4Plant.CFrame
	wait(0.2)
	game.ReplicatedStorage.Events.PlantC4:FireServer((pos+Vector3.new(0, -2.75, 0))*CFrame.Angles(math.rad(90), 0, math.rad(180)), "A")
	wait(0.2)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
	game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
	game.Workspace.CurrentCamera.CameraType = "Custom"
	game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end

for i,v in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
	if v:IsA("ValueBase") then
		local originalvalue = Instance.new(tostring(v.ClassName),v)
		originalvalue.Name = 'ORIGINALVALUE'
		originalvalue.Value = v.Value
	end
end

for i,v in pairs(game.ReplicatedStorage.HUInfo:GetDescendants()) do
	if v:IsA("ValueBase") then
		local originalvalue = Instance.new(tostring(v.ClassName),v)
		originalvalue.Name = 'ORIGINALVALUE'
		originalvalue.Value = v.Value
	end
end

function ModGun(toggle, valname, val)
	for i,v in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
		if v.Name == valname then
			if toggle == true then
				v.Value = val
			else
				v.Value = v.ORIGINALVALUE.Value
			end
		end
	end
end

local function KillAll()
pcall(function()
for i,v in pairs(game.Players:GetChildren()) do
	if v.Character and v.Character.Humanoid.Health>0 and game.Players.LocalPlayer.Character.EquippedTool and v.Team ~= game.Players.LocalPlayer.Team then
		local Arguments = {
			[1] = v.Character.Head,
			[2] = v.Character.Head.Position,
			[3] = game.Players.LocalPlayer.Character.EquippedTool.Value,
			[4] = 100,
			[5] = game.Players.LocalPlayer.Character.Gun,
			[8] = 10, -- Damage Multiplier
			[9] = false,
			[10] = false, -- Is Wallbang
			[11] = Vector3.new(),
			[12] = 100,
			[13] = Vector3.new()
		}
		game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))
	end
end
end)
end

local function d(plr)
pcall(function()
for i,v in pairs(game.Players:GetChildren()) do
	if v.Name == plr.Name and v.Character and v.Character.Humanoid.Health>0 and game.Players.LocalPlayer.Character.EquippedTool and v.Team ~= game.Players.LocalPlayer.Team then
		local Arguments = {
			[1] = v.Character.Head,
			[2] = v.Character.Head.Position,
			[3] = game.Players.LocalPlayer.Character.EquippedTool.Value,
			[4] = 100,
			[5] = game.Players.LocalPlayer.Character.Gun,
			[8] = 10, -- Damage Multiplier
			[9] = false,
			[10] = false, -- Is Wallbang
			[11] = Vector3.new(),
			[12] = 100,
			[13] = Vector3.new()
		}
		game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))
	end
end
end)
end

local camera = game.Workspace.CurrentCamera

local function GetArmsFolder()
for i,v in pairs(camera.Arms:GetChildren()) do
if v:IsA("Model") and v.Name ~= "AnimSaves" then
return v
end
end
end

spawn(function()
while true do
	for i = 0,1,0.01 do
		wait()
		_G.RAINBOWCLR = Color3.fromHSV(i,1,1)
	end
end
end)

print("Hex Hub | Setting tables...")

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
local oldIndex = mt.__index

if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end

mt.__namecall = newcclosure(function(...)
	   local method = getnamecallmethod()
	   local args = {...}
		--if tostring(method) == "InvokeServer" and tostring(args[1]) == "Hugh" then
		--	return wait(99e99)
		if tostring(method) == "FireServer" and string.find(tostring(args[1]),'{') then
			return wait(99e99)
		elseif tostring(method) == "FireServer" and tostring(args[1]) == "BURNME" and BypassesTab.flags.toggleAFire == true then
			return wait(99e99)
		elseif tostring(method) == "FireServer" and tostring(args[1]) == "FallDamage" and BypassesTab.flags.toggleAFall == true then
			return wait(99e99)
		elseif tostring(method) == "FireServer" and tostring(args[1]) == "HitPart" then
			args[9] = tonumber(RageTab.flags.dmgmulti)
			if args[2].Parent == game.Workspace.HexBacktrackFolder then
				local bplayer = args[2].PlayerName.Value
				local bpart = bplayer.Character[args[2].Name]
				args[2] = bpart
			elseif RageTab.flags.togglesilentaimbot == true then
				args[2] = getPlayer().Character.Head
				args[3] = getPlayer().Character.Head.Position
			end
		end
	return oldNamecall(unpack(args))
end)

if setreadonly then setreadonly(mt, true) else make_writeable(mt, false) end

print("Hex Hub | Starting Loops...")

UserInputService.InputBegan:Connect(function(key)
    if key.UserInputType == Enum.UserInputType.MouseButton1 and GunModsTab.flags.toggleplantanywhere == true then
		if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
       		if game.Players.LocalPlayer.Character.EquippedTool.Value == "C4" then
				PlantC4()
			end
		end
    end
end)

game:GetService("RunService").RenderStepped:Connect(function() wait()
	if RageTab.flags.toggle2 == true then
		KillAll()
	end
end)

game:GetService("RunService").RenderStepped:Connect(function() wait(0.05)
pcall(function()
	if TrollingTab.flags.toggle3 then
		local message = tostring(TrollingTab.flags.msg) -- Message
		local isTeam = TrollingTab.flags.toggle4 -- Is Team Chat
		local isDead = TrollingTab.flags.toggle5 -- Is Dead
		game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(message, isTeam, "Innocent", isDead, true)
	end
	
	if VisualTab.flags.thirdp == true then
		if game.Players.LocalPlayer.Character then
			game.Players.LocalPlayer.CameraMinZoomDistance = tostring(VisualTab.flags.tpd)
			game.Players.LocalPlayer.CameraMaxZoomDistance = tostring(VisualTab.flags.tpd)
			game.Workspace.ThirdPerson.Value = true
		end
	end
	
	if VisualTab.flags.WeaponsMode == "Invisible" then -- WeaponsMode
		for i,v in pairs(camera.Arms:GetChildren()) do
			if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") and v.Transparency ~= 1 then
				v.Transparency = 1
			end
		end
	elseif VisualTab.flags.WeaponsMode == "Rainbow" then
		for i,v in pairs(camera.Arms:GetChildren()) do
			if v:IsA("MeshPart") then
				v.TextureID = ""
				v.Material = "Neon"
				v.Color = _G.RAINBOWCLR
			elseif v:IsA("UnionOperation") then
				v.Material = "Neon"
				v.Color = _G.RAINBOWCLR
			end
		end
	end
	
	if VisualTab.flags.GlovesMode == "Invisible" then -- GlovesMode
		for i,v in pairs(GetArmsFolder():GetDescendants()) do
			if v:IsA("Part") then
				if v.Name == "Glove" and v.Transparency ~= 1 then
					v.Transparency = 1
				end
			end
		end
	elseif VisualTab.flags.GlovesMode == "Rainbow" then
		for i,v in pairs(GetArmsFolder():GetDescendants()) do
			if v:IsA("Part") then
				if v.Name == "Glove" and v:FindFirstChild("Mesh") then
					v.Mesh.TextureId = ""
					v.Color = _G.RAINBOWCLR
				end
			end
		end
	end
	
	if VisualTab.flags.ArmsMode == "Invisible" then -- ArmsMode
		for i,v in pairs(GetArmsFolder():GetDescendants()) do
			if v:IsA("Part") then
				if v.Name == "Right Arm" or v.Name == "Left Arm" or v.Name == "Sleeve" and v.Transparency ~= 1 then
					v.Transparency = 1
				end
			end
		end
	elseif VisualTab.flags.ArmsMode == "Rainbow" then
		for i,v in pairs(GetArmsFolder():GetDescendants()) do
			if v:IsA("Part") then
				if v.Name == "Right Arm" or "Left Arm" or "Sleeve" then
					if v.Name == "Sleeve" then
						v.Mesh.TextureId = ""
					end
					v.Color = _G.RAINBOWCLR
				end
			end
		end
	end
end)
end)

local HexESPFolder = Instance.new("Folder")
HexESPFolder.Parent = game.CoreGui
HexESPFolder.Name = "HexESPFolder"

spawn(function()
while wait(1) do
	HexESPFolder:ClearAllChildren()
end
end)

local function AddESP(plr)
spawn(function()
	while wait(0.1	) do
	if VisualTab.flags.ESPtoggle == true then
		pcall(function()
			if plr.Character and plr.Character.Humanoid.Health>0 then
				for i,v in pairs(plr.Character:GetChildren()) do
					if v:IsA("Part") or v:IsA("MeshPart") and v.Name ~= "HumanoidRootPart" then
						local NewESPPart = Instance.new("BoxHandleAdornment")
						NewESPPart.Name = plr.Name
						NewESPPart.Parent = HexESPFolder
						NewESPPart.Size = v.Size
						if VisualTab.flags.ESPFFAtoggle == true then
							NewESPPart.Color3 = Color3.new(0, 255, 255)
						else
							NewESPPart.Color3 = plr.TeamColor.Color
						end
						NewESPPart.Adornee = v
						NewESPPart.AlwaysOnTop = true
						NewESPPart.ZIndex = 0
					end
				end
			end
		end)
	end
	end
end)
end

for i,v in pairs(game.Players:GetChildren()) do
    if v ~= game.Players.LocalPlayer then
    	AddESP(v)
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	AddESP(plr)		
end)

local HexBacktrackFolder = Instance.new("Folder")
HexBacktrackFolder.Parent = game.Workspace
HexBacktrackFolder.Name = "HexBacktrackFolder"

local function AddBacktrack(plr)
spawn(function()
	while wait(0.1) do
	if MiscTab.flags.togglebacktrack == true then
		pcall(function()
			if plr.Character and plr.Character.Humanoid and plr.Character.Humanoid.Health>0 and plr.TeamColor ~= game.Players.LocalPlayer.TeamColor then
				for i,v in pairs(plr.Character:GetChildren()) do
					if v:IsA("MeshPart") or v:IsA("Part") and v.Transparency ~= 1 and v.Name ~= "HumanoidRootPart" then
						local BacktrackPart = Instance.new("Part")
						BacktrackPart.Parent = HexBacktrackFolder
						BacktrackPart.Name = v.Name
						BacktrackPart.Anchored = true
						BacktrackPart.CanCollide = false
						BacktrackPart.Position = v.Position
						BacktrackPart.Orientation = v.Orientation
						BacktrackPart.Size = Vector3.new(1, 1, 1)
						BacktrackPart.Transparency = 0.7
						BacktrackPart.BrickColor = BrickColor.new("Institutional white")
						BacktrackPart.Material = "SmoothPlastic"
						local BacktrackTag = Instance.new("ObjectValue")
						BacktrackTag.Parent = BacktrackPart
						BacktrackTag.Name = "PlayerName"
						BacktrackTag.Value = plr
						spawn(function()
							wait(MiscTab.flags.btt/1000)
							BacktrackPart:Destroy()
						end)
					end
				end
			end
		end)
	end
	end
end)
end

for i,v in pairs(game.Players:GetChildren()) do
    if v ~= game.Players.LocalPlayer then
    	AddBacktrack(v)
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	AddBacktrack(plr)		
end)

local currentCamera = game:GetService("Workspace").CurrentCamera
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local teamCheck = true

function getPlayer() [nonamecall]
	local closestPlayer = nil
	local shortestDistance = math.huge
	
	for i, v in pairs(game:GetService("Players"):GetChildren()) do
		if v.Name ~= game:GetService("Players").LocalPlayer.Name then
			if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and teamCheck and v.Team ~= game:GetService("Players").LocalPlayer.Team then
				local pos = currentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
				local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude

				if magnitude < shortestDistance then
					closestPlayer = v
					shortestDistance = magnitude
				end
			elseif v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and not teamCheck then
				local pos = currentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
				local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude

				if magnitude < shortestDistance then
					closestPlayer = v
					shortestDistance = magnitude
				end
			end
		end
	end
	
	return closestPlayer or game:GetService("Players").LocalPlayer
end

loadstring(game:HttpGet("https://pastebin.com/raw/13RMyme4", true))() -- Spectators List

FLYING = false
flyspeed = 1

function StopFLY()
	FLYING = false
	game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
end

function StartFLY(vfly)
	repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')
	repeat wait() until game.Players.LocalPlayer:GetMouse()
	
	local T = game.Players.LocalPlayer.Character.HumanoidRootPart
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0
	
	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			repeat wait()
			if not vfly then
				game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
			end
			if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
				SPEED = 50
			elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
				SPEED = 0
			end
			if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
				BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
			elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
				BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
			else
				BV.velocity = Vector3.new(0, 0, 0)
			end
			BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:destroy()
			BV:destroy()
			game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
		end)
	end
	game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(KEY)
		if KEY:lower() == 'w' then
			if not vfly then
				CONTROL.F = flyspeed
			end
		elseif KEY:lower() == 's' then
			if not vfly then
				CONTROL.B = - flyspeed
			end
		elseif KEY:lower() == 'a' then
			if not vfly then
				CONTROL.L = - flyspeed
			end
		elseif KEY:lower() == 'd' then 
		    if not vfly then
				CONTROL.R = flyspeed
            end
        elseif KEY:lower() == 'e' then
            if not vfly then
                CONTROL.Q = flyspeed*2
            end
        elseif KEY:lower() == 'q' then
            if not vfly then
                CONTROL.E = -flyspeed*2
            end
		end
	end)
	game.Players.LocalPlayer:GetMouse().KeyUp:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
            CONTROL.R = 0
        elseif KEY:lower() == 'e' then
            CONTROL.Q = 0
        elseif KEY:lower() == 'q' then
            CONTROL.E = 0
		end
	end)
	FLY()
end

print("Hex Hub | Loaded!")