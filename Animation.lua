local class = require("class");
local anim = class:derive("Animation");
local Vector2 = require("Vector2")

function anim:new(x,y,w,h,column_size,num_frames,fps)
    self.fps = fps;
    self.timer = 1/fps;
    self.frame = 1;
    self.num_frames = num_frames;
    self.column_size = column_size;
    self.start_offset = Vector2(x,y);
    self.offset = Vector2();
    self.size = Vector2(w,h);
end

function anim:reset()
    self.timer = 1/ self.fps;
    self.frame = 1;
end

function anim:update(dt, quad)
    self.timer = self.timer -dt;
    if self.timer <= 0 then
        self.timer = 1/self.fps;
        self.frame = self.frame +1;
        if self.frame > self.num_frames then self.frame = 1; end
        self.offset.x = self.start_offset.x + (self.size.x * (self.frame -1 ));
        self.offset.y = self.start_offset.y + (self.size.y * math.floor(self.frame / self.column_size));
        quad:setViewport(self.offset.x, self.offset.y, self.size.x, self.size.y)
    end
end

return anim;