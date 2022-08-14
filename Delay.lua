--[[

    This is a simple delay effect.
    It should implement a simple ring buffer and delay the input by the given amount of samples.

]]--


--[[
    The Delay class.
]]--
Delay = {}
Delay.__index = Delay

Delay.new = function(self, delay_time)
    local obj = {}
    setmetatable(obj, Delay)
    obj.delay_time = delay_time
    obj.delay_buffer = {}
    obj.delay_buffer_size = 0
    obj.delay_buffer_index = 0
    return obj
end


--[[
    The process function.
    It should take the input and delay it by the given amount of samples.
]]--
Delay.process = function(self, input)
    self.delay_buffer[self.delay_buffer_index] = input
    self.delay_buffer_index = self.delay_buffer_index + 1
    if self.delay_buffer_index >= self.delay_buffer_size then
        self.delay_buffer_index = 0
    end
    return self.delay_buffer[self.delay_buffer_index]
end

--[[
    The set_delay_time function.
    It should set the delay time to the given amount of samples.
]]--
Delay.set_delay_time = function(self, delay_time)
    self.delay_time = delay_time
    self.delay_buffer_size = delay_time
end


--[[
    The get_delay_time function.
    It should return the delay time.
]]--
Delay.get_delay_time = function(self)
    return self.delay_time
end

Delay.reset = function(self)
    self.delay_buffer = {}
    self.delay_buffer_size = 0
    self.delay_buffer_index = 0
end

--[[
    The get_delay_buffer function.
    It should return the delay buffer.
]]--
Delay.get_delay_buffer = function(self)
    return self.delay_buffer
end


--[[
    The get_delay_buffer_size function.
    It should return the delay buffer size.
]]--
Delay.get_delay_buffer_size = function(self)
    return self.delay_buffer_size
end

--[[
    output the current value at current index
]]--

Delay.output = function(self)
    return self.delay_buffer[self.delay_buffer_index]
end
