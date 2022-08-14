--[[
    This is a simple filter effect, it should implement a simple FIR filter for smoothing the input signal.
]]


--[[
    The Filter class.
]]
Filter = {}
Filter.__index = Filter

Filter.new = function(self, filter_coefficients)
    local obj = {}
    setmetatable(obj, Filter)
    obj.filter_coefficients = filter_coefficients
    obj.filter_buffer = {}
    obj.filter_buffer_size = 0
    obj.filter_buffer_index = 0
    return obj
end


--[[
    The process function.
    It should take the input and filter it by the given coefficients.
]]
Filter.process = function(self, input)
    self.filter_buffer[self.filter_buffer_index] = input
    self.filter_buffer_index = self.filter_buffer_index + 1
    if self.filter_buffer_index >= self.filter_buffer_size then
        self.filter_buffer_index = 0
    end
    local output = 0
    for i = 0, self.filter_buffer_size - 1 do
        output = output + self.filter_buffer[i] * self.filter_coefficients[i]
    end
    return output
end

Filter.set_filter_coefficients = function(self, filter_coefficients)
    self.filter_coefficients = filter_coefficients
    self.filter_buffer_size = #filter_coefficients
end

Filter.set_filter_buffer_size = function(self, filter_buffer_size)
    self.filter_buffer_size = filter_buffer_size
    self.filter_buffer = {}
    for i = 0, filter_buffer_size - 1 do
        self.filter_buffer[i] = 0
    end
end

--[[
    The output function.
    It should return the filtered output.
]]

Filter.output = function(self)
    return self.filter_buffer[self.filter_buffer_index]
end

