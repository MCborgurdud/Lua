local tool = Instance.new("Tool") -- Create the tool
tool.Name = "Fling"
tool.RequiresHandle = false -- No need for a handle

-- Function to fling all players
local function flingAll()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local root = player.Character.HumanoidRootPart
            root.Velocity = Vector3.new(math.random(-9999, 9999), 9999, math.random(-9999, 9999)) -- Fling force
        end
    end
end

-- Connect tool activation to fling function
tool.Activated:Connect(flingAll)

-- Give the tool to the player who ran the script
game.Players.PlayerAdded:Connect(function(player)
    if not player.Backpack:FindFirstChild("Fling") then
        local newTool = tool:Clone()
        newTool.Parent = player.Backpack
    end
end)
