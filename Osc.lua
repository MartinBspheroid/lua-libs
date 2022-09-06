--[[
    Osc.lua
    
    Class for oscillator objects.
    oscillators are just simple classes, they have just one function: update
        - value is last calculated, well, value. Acts as current output.
        - update() calculates new value and returns it.
        - all oscillators have common range: 0-1, eg. they are unipolar


    TODO: remove RingBuffer and keep this as clean as possible, ring buffer will be part of OscOp.lua

]]
require "RingBuffer"
local str = require "str"
oscType = {
    sq = 1,
    sine = 2,
    tri = 3,
    saw = 4,
    noise = 5

}
Osc = {}
Osc.__index = Osc

local function setOsc(self, _oscType)

    if _oscType == oscType.sine then
        return function(self)
            self.phase = self.phase + self.freq / self.sampleRate
            self.value = math.sin(self.phase * math.pi * 2) * 0.5 + 0.5

        end
    end

    if _oscType == oscType.sq then
        return function(self)
            -- square wave oscillator
            self.phase = self.phase + self.freq / self.sampleRate
            if self.phase > 1 then
                self.phase = self.phase - 1
            end
            if self.phase < 0.5 then
                self.value = 1
            else
                self.value = 0
            end


        end
    end
    -- saw implementation

    if _oscType == oscType.saw then
        return function(self)
            self.phase = self.phase + (self.freq / self.sampleRate)
            self.value = (self.phase % 1)

        end
    end


    -- tri implementation, signal is going up and down, phase is the position in the cycle
    if _oscType == oscType.tri then
        return function(self)
            self.phase = self.phase + (self.freq / self.sampleRate)
            local phaseIncrement = self.phase % 1

            if phaseIncrement < 0.5 then
                self.value = phaseIncrement * 2
            else
                self.value = 1 - (phaseIncrement - 0.5) * 2
            end


        end
    end

    -- noise implementation
    if _oscType == oscType.noise then
        return function(self)
            self.value = math.random()

        end
    end
end

function Osc.new()
    local instance = setmetatable({}, Osc)

    instance.freq = 2
    instance.phase = 0
    instance.value = 0
    instance.sampleRate = 60

    instance.type = oscType.sine
    instance.buf = RingBuffer.new(100)
    instance.update = setOsc(instance, instance.type)
    instance.setOsc = function(self, _oscType)
        self.type = _oscType
        self.update = setOsc(self, self.type)
    end
    return instance;

end
