-- Set the monitor to the side where it's connected
local monitor = peripheral.wrap("right") -- Change "top" to the side where your monitor is located

-- Function to apply colors to a player's name
local function colorizePlayerName(playerName)
    local colors = {
        -- Add more players and colors as needed
    }

    if colors[playerName] then
        return colors[playerName]
    else
        return playerName
    end
end

-- Function to clear the screen
local function clearScreen()
    monitor.clear()
    monitor.setCursorPos(1, 1)
end

-- Clear the screen initially
clearScreen()

-- Function to display a chat message with colored player names and log it to the console
local function displayChatMessage(playerName, message)
    local x ,y = monitor.getCursorPos()
    monitor.setCursorPos(1, y + 1)

    monitor.setTextColour(colorizePlayerName(playerName))
    monitor.write(playerName)

    monitor.setTextColour(colors.white)
    monitor.write(": " .. message)

    print(playerName .. ": " .. message)
end

-- Event handler for chat messages
while true do
    local event, player, message = os.pullEvent("chat")
    displayChatMessage(player, message)
end
