local Math = {}

function Math.clamp(n, low, high)
   return math.min(math.max(n, low), high)
end

function Math.sq(n)
   return n * n
end

function Math.dist(x1, y1, x2, y2)
   return math.sqrt(Math.sq(x2 - x1) + Math.sq(y2 - y1))
end

function Math.lerp(start, stop, amt)
   return start + (stop - start) * amt
end

function Math.mag(x, y)
   return math.sqrt(Math.sq(x) + Math.sq(y))
end

function Math.map(n, start1, stop1, start2, stop2)
   if n == nil then
      return 0
   end
   return start2 + (stop2 - start2) * ((n - start1) / (stop1 - start1))
end

function Math.max(args)
   return math.max(_tl_table_unpack(args))
end

function Math.min(args)
   return math.min(_tl_table_unpack(args))
end

function Math.norm(n, start, stop)
   return (n - start) / (stop - start)
end

function Math.round(n, decimals)
   return math.floor(n * 10 ^ decimals + 0.5) / 10 ^ decimals
end

function Math.fract(n)
   return n - math.floor(n)
end

-- function Math.norm(n, start, stop)
--    return (n - start) / (stop - start)
-- end


function Math.degrees(radians)
   return radians * 180 / math.pi
end

function Math.radians(degrees)
   return degrees * math.pi / 180
end

return Math
