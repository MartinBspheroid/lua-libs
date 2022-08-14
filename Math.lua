function clamp(n, low, high)
   return math.min(math.max(n, low), high)
end

function sq(n)
   return n * n
end

function dist(x1, y1, x2, y2)
   return math.sqrt(sq(x2 - x1) + sq(y2 - y1))
end

function lerp(start, stop, amt)
   return start + (stop - start) * amt
end

function mag(x, y)
   return math.sqrt(sq(x) + sq(y))
end

function map(n, start1, stop1, start2, stop2)
   return start2 + (stop2 - start2) * ((n - start1) / (stop1 - start1))
end

function max(args)
   return math.max(_tl_table_unpack(args))
end

function min(args)
   return math.min(_tl_table_unpack(args))
end

function norm(n, start, stop)
   return (n - start) / (stop - start)
end


function round(n, decimals)
   return math.floor(n * 10 ^ decimals + 0.5) / 10 ^ decimals
end


function fract(n)
   return n - math.floor(n)
end


function norm(n, start, stop)
   return (n - start) / (stop - start)
end


function degrees(radians)
   return radians * 180 / math.pi
end

function radians(degrees)
   return degrees * math.pi / 180
end

