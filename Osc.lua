
 oscType = {
    sq = 1,
    sine = 2,
    tri = 3,
    saw = 4,
    noise = 5

}
Osc = {}
Osc.__index = Osc


function createOsc(_oscType)
   local instance = setmetatable({}, Osc)
   
   instance.freq = 20
   instance.phase = 0
   instance.value = 0
    instance.sampleRate = 60
   instance.type = _oscType


    if _oscType == oscType.sine then
        instance.update = function(self)
            self.phase = self.phase + self.freq / self.sampleRate
            self.value = math.sin(self.phase*math.pi*2)
        end
        end

   if _oscType == oscType.sq then
         instance.update = function(self)
             -- square wave oscillator 
                self.phase = self.phase + self.freq / self.sampleRate
                if self.phase > 1 then
                    self.phase = self.phase - 1
                end
                if self.phase < 0.5 then
                    self.value = 1
                else
                    self.value = -1
                end

         end
  end
  -- saw implementation

  if _oscType == oscType.saw then
    instance.update = function(self)
          self.phase = self.phase + (self.freq / self.sampleRate)
          self.value = 2 - (self.phase % 1) * 2 - 1
      end
  end
      

  -- tri implementation, signal is going up and down, phase is the position in the cycle
  if _oscType == oscType.tri then
      instance.update = function(instance)
            instance.phase = instance.phase + (instance.freq / instance.sampleRate)
            local phaseIncrement = instance.phase % 1

            if phaseIncrement < 0.5 then
                instance.value = phaseIncrement * 4 - 1
            else
                instance.value = 3 - phaseIncrement * 4
            end
        
      end
  end

  -- noise implementation
  if _oscType == oscType.noise then
      instance.update = function(instance)
          instance.value = math.random() * 2 - 1 
      end
  end

  return instance; 

end