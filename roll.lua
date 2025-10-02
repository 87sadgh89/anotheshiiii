-- Services with cloneref
local cloneref = cloneref or function(o) return o end
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local Players = cloneref(game:GetService("Players"))

local Bridge = ReplicatedStorage.Remotes.Bridge
local Sync = ReplicatedStorage.Remotes.Sync 

local function executeActions()

    firesignal(Bridge.OnClientEvent, "Mouth", "\255")

    Sync:InvokeServer("Character", "Customization", "Mouth", "\255")
end

executeActions()

wait(0.5)

-- Rejoin the game
local player = Players.LocalPlayer
TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
