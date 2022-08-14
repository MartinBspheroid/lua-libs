--[[

    This is a simple envelope class
    It should implement a simple AR envelope generator with trigger and output functions

    The envelope class should have the following functions:
    - new(self, attack_time, release_time)

    - trigger(self)
    - output(self)
    - set_attack_time(self, attack_time)
    - set_release_time(self, release_time)
    - get_attack_time(self)
    - get_release_time(self)
    
]]--


Envelope = {}
Envelope.__index = Envelope

Envelope.new = function(self, attack_time, release_time)
    local envelope = {}
    setmetatable(envelope, Envelope)
    envelope.attack_time = attack_time
    envelope.release_time = release_time
    envelope.attack_time_counter = 0
    envelope.release_time_counter = 0
    envelope.output = 0
    envelope.trigger = false
    return envelope
end

Envelope.trigger = function(self)
    self.trigger = true
end

Envelope.output = function(self)
    if self.trigger == true then
        self.attack_time_counter = self.attack_time_counter + 1
        if self.attack_time_counter >= self.attack_time then
            self.attack_time_counter = self.attack_time
            self.trigger = false
        end
        self.output = self.attack_time_counter / self.attack_time
    else
        self.release_time_counter = self.release_time_counter + 1
        if self.release_time_counter >= self.release_time then
            self.release_time_counter = self.release_time
            self.output = 0
        end
        self.output = 1 - (self.release_time_counter / self.release_time)
    end
    return self.output
end

Envelope.set_attack_time = function(self, attack_time)
    self.attack_time = attack_time
end

Envelope.set_release_time = function(self, release_time)
    self.release_time = release_time
end

Envelope.get_attack_time = function(self)
    return self.attack_time
end

Envelope.get_release_time = function(self)
    return self.release_time
end
