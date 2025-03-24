-- This script should be placed in the Tool object in StarterPack

local tool = script.Parent
local players = game:GetService("Players")

-- Function to fling all players
local function flingPlayers()
    for _, player in pairs(players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local character = player.Character
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

            -- Apply a random force to fling the player
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)  -- Make sure it's enough to fling
            bodyVelocity.Velocity = Vector3.new(math.random(-500, 500), 500, math.random(-500, 500))  -- Random direction
            bodyVelocity.Parent = humanoidRootPart

            -- Remove the BodyVelocity after 0.5 seconds to stop the fling effect
            game.Debris:AddItem(bodyVelocity, 0.5)
        end
    end
end

-- When the tool is activated, fling all players
tool.Activated:Connect(flingPlayers)
