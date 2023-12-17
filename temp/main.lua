push = require 'push'

--[[how to get started with love 2d]]
WINDOW_WIDTH = 1280 -- defining an variable int in lua
WINDOW_HEIGHT = 720

Virtual_Width = 432
Viretual_Height = 243 
Paddle_Speed = 200

--[[
    love load function be a function that will be a pre defined function which will load all the things at the innital stage of the 
        game starting
]]
function love.load()
    --love.window.setMode() -- this sets the gaming window/
    love.graphics.setDefaultFilter('nearest', 'nearest')
    scoreFont = love.graphics.newFont('font.ttf', 32)
    love.graphics.setFont(love.graphics.newFont('font.ttf',8))
    push:setupScreen(Virtual_Width,Viretual_Height,WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
    Player1Score = 0
    Player2Score = 0

    Player1Y = Viretual_Height/2
    Player2Y = Viretual_Height/2

end
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

--[[
    drew function is used to drow something on the screen
]]
function love.update(dt)
    if love.keyboard.isDown('w') then 
        Player1Y = Player1Y + -Paddle_Speed*dt
    elseif love.keyboard.isDown('s') then 
        Player1Y = Player1Y + Paddle_Speed*dt
    end

    if love.keyboard.isDown('up') then
        Player2Y = Player2Y +- Paddle_Speed*dt
    elseif love.keyboard.isDown('down') then 
        Player2Y = Player2Y + Paddle_Speed*dt
    end
end
function love.draw()
    push:apply('start')
    love.graphics.clear(254, 193, 0, 255)
    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(Player1Score),Virtual_Width/2 - 50, Viretual_Height/3)
    love.graphics.print(tostring(Player2Score),Virtual_Width/2 + 30, Viretual_Height/3)
    love.graphics.rectangle('fill',10,Player1Y,5,20)
    love.graphics.rectangle('fill',Virtual_Width-10, Player2Y, 5, 20)
    love.graphics.rectangle('fill', Virtual_Width/2 -2.5 , Viretual_Height/2 - 2.5,5,5)
    love.graphics.setFont(love.graphics.newFont('font.ttf',8))
    love.graphics.printf(
        'Hello Pong!',          -- text to render
        0,                      -- starting X (0 since we're going to center it based on width)
        0,  -- starting Y (halfway down the screen)
        Virtual_Width,           -- number of pixels to center within (the entire screen here)
        'center')               -- alignment mode, can be 'center', 'left', or 'right'
    push:apply('end') 
end
