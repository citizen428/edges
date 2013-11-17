function tobool (x)
   return not not x
end

function table.count (t, x)
   local count = 0
   for _, v in pairs(t) do
      if v == x then
         count = count + 1
      end
   end
   return count
end

function table.grep (t, x)
   local res = {}
   local idx = 1
   for i, v in pairs(t) do
      if v == x then
         res[idx] = v
         idx = idx + 1
      end
   end
   return res
end

function table.invert (t)
   local rev = {}
   for k, v in pairs(t) do
      rev[v] = k
   end
   return rev
end

function table.inspect (t)
   for k,v in pairs(t) do
      print(k, type(v))
   end
end

function table.inspectArray (t)
   print(table.concat(t, ", "))
end

function table.keys (t, f)
   if f then
      for k,_ in pairs(t) do
         f(k)
      end
   else
      local res = {}
      local idx = 1

      for k,_ in pairs(t) do
         res[idx] = k
         idx = idx + 1
      end
      return res
   end
end

function table.values (t, f)
   if f then
      for _,v in pairs(t) do
         f(k)
      end
   else
      local res = {}
      local idx = 1

      for _,v in pairs(t) do
         res[idx] = k
         idx = idx + 1
      end
      return res
   end
end

local object = {}

function object.methods (t, f)
   f = f or print
   for k,v in pairs(t) do
      if type(v) == 'function' then
         f(k)
      end
   end
end

function object.fields (t, f)
   for k,v in pairs(t) do
      if type(v) ~= 'function' then
         f(k)
      end
   end
end

function string:count (c)
   return select(2, string.gsub(self, c, c))
end
