--[[
    This is a simple sequence implementation.
    It should implement a simple buffer and index for the sequence.
    
    output function:
        This function should return the current output of the sequence.
    
    set_sequence function:
        This function should set the sequence to the given array.   
        
    step function:
        This function should step the sequence to the next element, in case of a loop it should step back to the first element.
    
    set_length function:
        This function should set the length of the sequence to the given amount of elements. 
            If the length is smaller than the current length, the sequence should be truncated.
            If the length is larger than the current length, 
            the sequence should be with the new length filled values copied from the current sequence using modulo arithmetic.

]] --


--[[
    The Sequence class.
]] --
Sequence = {}
Sequence.__index = Sequence


Sequence.new = function(self)
    local obj = {}
    setmetatable(obj, Sequence)
    obj.length = 0
    obj.index = 1
    obj.sequence = {}
    obj.index = 0
    return obj
end


--[[
    The output function.
    It should return the current output of the sequence.
]] --
Sequence.output = function(self)
    return self.sequence[self.index]
end

--[[
    The set_sequence function.
    It should set the sequence to the given array.
]] --

Sequence.set_sequence = function(self, sequence)
    self.sequence = sequence
    self.length = #sequence

end

Sequence.set_step = function(self, step, val)
    self.sequence[step] = val
end
Sequence.set_index = function(self, index)
    self.index = index
end

--[[
    The step function.
    It should step the sequence to the next element, in case of a loop it should step back to the first element.
]] --

Sequence.step = function(self)

    self.index = self.index + 1
    if self.index > self.length then
        self.index = 1
    end

end

Sequence.set_length = function(self, length)
    if length < #self.sequence then
        self.sequence = {}
        for i = 0, length - 1 do
            self.sequence[i] = self.sequence[i % #self.sequence]
        end
    else
        for i = #self.sequence, length - 1 do
            self.sequence[i] = self.sequence[i % #self.sequence]
        end
    end
end
Sequence.clear = function(self)
    for i = 0, #self.sequence do
        self.sequence[i] = 0
    end
end
