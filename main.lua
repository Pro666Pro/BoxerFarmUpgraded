-- go ahead skid it idc

game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Credits",Text = "Made By DonjoSx, Upgraded By Nexer1234 (version: v5.0)" ,Duration = 10, Icon = "rbxthumb://type=Asset&id=9649923610&w=150&h=150",Button1 = "alright dud"})

if not game.IsLoaded then
    game.Loaded:Wait()
end

loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/BypassAntiCheat/main/main.lua'))()

wait(0.1)

if workspace:FindFirstChild("Baseplate") == nil then
local S = Instance.new("Part")
S.Name = "Baseplate"
S.Anchored = true
S.CanCollide = true
S.Transparency = 0
S.Position = Vector3.new(-7000, -7000, -7000)
S.Size = Vector3.new(1000, 10, 1000)
S.Parent = workspace
end

for _,v in pairs(game.Players:GetChildren()) do
	if v.Character:FindFirstChild("rock") then
        	v.Character:FindFirstChild("rock").CanTouch = false
        	v.Character:FindFirstChild("rock").CanQuery = false
		v.Character:FindFirstChild("rock").CanCollide = false
	end
end

fireclickdetector(workspace.Lobby["Boxer"].ClickDetector)

wait(.3)

if GhostInvis == true then

fireclickdetector(workspace.Lobby["Ghost"].ClickDetector)

wait(.5)

game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()

wait(.3)

fireclickdetector(workspace.Lobby["Boxer"].ClickDetector)

wait(.6)
	
game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Ghost Invisibility Activated" ,Duration = 10, Icon = "rbxthumb://type=Asset&id=9649923610&w=150&h=150",Button1 = "Ok"})
  
end

repeat task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-909, 328, 3) -- regular arena
until game.Players.LocalPlayer.Character:FindFirstChild("entered")
wait(.12)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Baseplate"].CFrame * CFrame.new(0,10,0)

wait(.35)

if SlappleFarm == true then

for i, v in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Slapple" or v.Name == "GoldenSlapple" and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 1)
                end
            end

game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Slapple's Collected" ,Duration = 10, Icon = "rbxthumb://type=Asset&id=9649923610&w=150&h=150",Button1 = "Ok"})
  
end

if FarmToolbox == true then
if game.Workspace:FindFirstChild("Toolbox") then
fireclickdetector(game.Workspace.Toolbox.ClickDetector)
end
end

if FarmOrbs == true then
if game.Workspace:FindFirstChild("MATERIALIZEOrb") then
game.Workspace.MATERIALIZEOrb.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
if game.Workspace:FindFirstChild("JetOrb") then
game.Workspace.JetOrb.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
if game.Workspace:FindFirstChild("PhaseOrb") then
game.Workspace.PhaseOrb.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
if game.Workspace:FindFirstChild("GlitchOrb") then
game.Workspace.GlitchOrb.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
if game.Workspace:FindFirstChild("SiphonOrb") then
game.Workspace.SiphonOrb.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
end

game:GetService("ReplicatedStorage").GeneralAbility:FireServer()

wait(0.2)

if not SeverHOPSet then 
    SeverHOPSet = { 
        ErrorReply = "rejoin", 
        SwitchServerType = "serverhop" 
    }
end
 
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
 
-- Function to get a random player from the server
local function getRandomPlayer()
    local players = Players:GetPlayers()
    local randomPlayer
 
    repeat wait()
        randomPlayer = players[math.random(1, #players)]
    until randomPlayer ~= localPlayer 
          and randomPlayer.Character:FindFirstChild("Ragdolled").Value == false
 
    return randomPlayer
end
 
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end
 
local target = getRandomPlayer()
if target then
    spawn(function()
        while wait() do
            localPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
        end 
    end)
wait()
    spawn(function()
	wait(.7)
        for i = 1, 1000 do
            spawn(function()
		localPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
                game.ReplicatedStorage.Events.Boxing:FireServer(target, true)
				game.ReplicatedStorage.Events.Boxing:FireServer(target, false)	

            end)      
        end
    end)
    wait(.9)
    Teleport()
else
Teleport() end

for i = 1, 9999 do
Teleport()
end
