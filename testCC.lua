-- Set the monitor to the side where it's connected
local monitor = peripheral.wrap("right") -- Change "top" to the side where your monitor is located

-- Function to apply colors to a player's name
local function colorizePlayerName(playerName)
    local colors = {
        ["huntercobra18"] = colors.red,
        ["forst 76"] = colors.blue,
        ["Player3"] = colors.green,
        -- Add more players and colors as needed
    }

    if colors[playerName] then
        return colors[playerName] .. playerName .. colors.white
    else
        return playerName
    end
end

-- Function to clear the screen
local function clearScreen()
    monitor.clear()
    monitor.setCursorPos(1, 1)
end

-- Function to display a chat message with colored player names and log it to the console
local function displayChatMessage(playerName, message)
    clearScreen() -- Clear the screen before displaying a new message
    local formattedMessage = colorizePlayerName(playerName) .. ": " .. message
    monitor.write(formattedMessage)
    print(formattedMessage) -- Print the message to the computer's console
end

-- Initialize rednet
rednet.open("top") -- Change "top" to the side where your modem is located

-- Clear the screen initially
clearScreen()

-- Event handler for chat messages using rednet
while true do
    local senderId, message, protocol = rednet.receive()
    displayChatMessage(senderId, message)
end
