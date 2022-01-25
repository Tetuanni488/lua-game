local Class = {};
Class.__index = Class;

 function Class:new()
end

 function Class:derive(t)
    local new_c = {};
    new_c.t = t;
    new_c.__index = new_c;
    new_c.super = self;
    setmetatable(new_c,self)
    return new_c;
end

 function Class:__call(...)
    local ins = setmetatable({},self)
    ins:new(...)
    return ins;
end

 function Class:get_type()
    return self.t;
end

return Class;