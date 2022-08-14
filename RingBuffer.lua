--[[
    RingBuffer.lua
    
    RingBuffer is a simple ring buffer implementation.

]] -- 
--[[
    The RingBuffer class.
]] --
RingBuffer = {}
RingBuffer.__index = RingBuffer

RingBuffer.new = function(size)
    local obj = setmetatable({}, RingBuffer)
    obj.size = size
    -- create the buffer with zero values as default values

    obj.buffer = {}

    for i = 1, size do
        obj.buffer[i] = 0
    end
    obj.pos = 0
    return obj
end

--[[
    The write function.
    It should write the given value to the ring buffer.
]] --
RingBuffer.write = function(self, value)
    self.buffer[self.pos] = value
    self.pos = self.pos + 1
    if self.pos >= self.size then
        self.pos = 0
    end
end


--[[
    The read function.
    It should read the value at the given offset from the ring buffer.
    If the offset is out of bounds it should wrap around the ring buffer.

]] --
RingBuffer.read = function(self, offset)
    -- use modulo arithmetic to wrap around the ring buffer if the offset is out of bounds
    local pos = (self.pos - offset) % self.size
    return self.buffer[pos]

end
-- return buffer as array of values

RingBuffer.get = function(self)
    return self.buffer
end

-- test code 
--[[
local buf = RingBuffer.new(100)


for i = 1, 100 do
    buf.write(buf, i)
end

for i = 1, 100 do
    print(buf.read(buf, i))
end

]]--    