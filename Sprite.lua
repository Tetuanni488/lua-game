local class = require("class");
local sprite = class:derive("Sprite");

function sprite:new()
    self.animations = {};
end

function sprite:animate(anim_name)

end

function sprite:update(dt)

end

function sprite:draw()

end

return sprite;