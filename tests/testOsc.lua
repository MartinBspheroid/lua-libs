require "Osc"

-- test code

--- this should do 0.2 seconds of square wave at 20hz
local osc = createOsc(oscType.sq)
osc.sampleRate = 44100
osc.freq = 20

function test()
    for i = 1, (44100 * 0.2) do
        if i % 100 == 0 then
            print(osc.value .. " " .. osc.phase)
        end
        osc.update(osc)

    end
    osc.update(osc)
    print(osc.value .. " " .. osc.phase)
end
test()
