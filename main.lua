local Anim = require("Animation")

local astranauta_texture;
local astranauta_sprite;
local player = {
    x = 5,
    y = 5,
    scale = 2
}

local angle = 0;
local fps = 10;
local anim_timer = 1/fps;
local frame = 1;
local num_frame = 3;
local xoffest;


local a = Anim(32,32,32,58,4,3,10)

function love.load()
    print("lol")
    love.graphics.setDefaultFilter("nearest","nearest")
    astranauta_texture = love.graphics.newImage("assets/textures/entities/Astranauta.png");
    astranauta_sprite = love.graphics.newQuad(32,32,32,46,astranauta_texture:getDimensions())
end

-- if dt>0.035 then return end
-- anim_timer = anim_timer -dt;
-- if anim_timer <= 0 then
--     anim_timer = 1/fps;
--     frame = frame +1
--     if frame > num_frame then frame = 1 end
--     xoffest = 32*frame;
--     astranauta_sprite:setViewport(xoffest,32,32,48)
-- end

function love.update(dt)
    if dt>0.035 then return end

    a:update(dt, astranauta_sprite)

    if love.keyboard.isDown("d") then
        player.scale = 2;
        if player.scale == -2 then
            player.x = player.x -64
        else
            player.x = player.x +2
        end
        
    end
    if love.keyboard.isDown("a") then
        player.scale = -2;
        if player.scale == 2 then
            player.x = player.x +64
        else
            player.x = player.x -2
        end
    end
    if love.keyboard.isDown("w") then
        player.y = player.y - 4
    end
    if love.keyboard.isDown("s") then
        player.y = player.y +4
    end
end

function love.draw()
    love.graphics.draw(astranauta_texture,astranauta_sprite,player.x,player.y,math.rad(0),player.scale,2,1,1)
end