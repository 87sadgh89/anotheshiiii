local cloneref = cloneref or function(o) return o end
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))

if not ReplicatedStorage:FindFirstChild("Remotes") then
    ReplicatedStorage:WaitForChild("Remotes")
end

local Remotes = ReplicatedStorage.Remotes

if not Remotes:FindFirstChild("Bridge") then
    Remotes:WaitForChild("Bridge")
end

if not Remotes:FindFirstChild("Sync") then
    Remotes:WaitForChild("Sync")
end

local Bridge = Remotes.Bridge
local Sync = Remotes.Sync

local LOOP_DELAY = 2

local function executeActions()
    pcall(function()
        firesignal(Bridge.OnClientEvent, "Mouth", "\255")
    end)
    
    pcall(function()
        Sync:InvokeServer("Character", "Customization", "Mouth", "\255")
    end)
end

while true do
    executeActions()
    wait(LOOP_DELAY)
end
