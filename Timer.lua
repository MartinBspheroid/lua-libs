--[[
    Basic timer class, based on os.clock and os.time.
    Timer is a singleton class, so you can use Timer.instance to
     get the instance and set funtion to call after it will be elapsed.
    Timer.instance.start() starts the timer.
    Timer.instance.stop() stops the timer.
    Timer.instance.reset() resets the timer.
    Timer.instance.getTime() returns the time elapsed since the timer was started.

]]

Timer = {}
Timer.__index = Timer

Timer.instance = nil

Timer.new = function()
    if Timer.instance == nil then
        Timer.instance = {}
        setmetatable(Timer.instance, Timer)
    end
    return Timer.instance
end

Timer.start = function(self)
    self.startTime = os.clock()
end

Timer.stop = function(self)
    self.stopTime = os.clock()
end

Timer.reset = function(self)
    self.startTime = nil
    self.stopTime = nil
end

Timer.getTime = function(self)
    if self.startTime == nil then
        return 0
    end
    if self.stopTime == nil then
        return os.clock() - self.startTime
    end
    return self.stopTime - self.startTime
end

Timer.update = function(self)
    if self.startTime == nil then
        return
    end
    if self.stopTime == nil then
        return os.clock() - self.startTime
    end
    return self.stopTime - self.startTime
end
