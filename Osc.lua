local oscType = {}

Osc = {}
Osc.__index = Osc


function createOsc(_oscType)
   local instance = setmetatable({}, Osc)
   instance.amp = 1
   instance.freq = 20
   instance.phase = 0
   instance.value = 0
   instance.type = _oscType


   if _oscType == oscType.sq then
      instance.update = function(instance)
          if instance.phase < math.pi then
              instance.value = 1
          else
              instance.value = -1
          end
          instance.phase = instance.phase + (instance.freq / instance.sampleRate)
      end
  end
  -- saw implementation

  if _oscType == oscType.saw then
      instance.update = function(instance)
          instance.value = instance.phase / math.pi
          instance.phase = instance.phase + (instance.freq / instance.sampleRate)
      end
  end

  -- tri implementation
  if _oscType == oscType.tri then
      instance.update = function(instance)
          if instance.phase < math.pi then
              instance.value = instance.phase / math.pi
          else
              instance.value = 1 - (instance.phase / math.pi)
          end
          instance.phase = instance.phase + (instance.freq / instance.sampleRate)
      end
  end

  -- noise implementation
  if _oscType == oscType.noise then
      instance.update = function(instance)
          instance.value = math.random()
      end
  end

  return instance; 

end

-- test code
local osc = createOsc(oscType.sq)
osc.sampleRate = 44100
osc.freq = 440
osc.update(osc)

for i = 1, 100 do
    osc.update(osc)
    print(osc.value)
end