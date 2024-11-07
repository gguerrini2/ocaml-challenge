let guess5 x = if(x >= 1 && x <= 5) then 
  if(Random.int(5) == x) then (true, ) 
  else (false, x)