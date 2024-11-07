let is_even x =
  if (x mod 2) == 0 then true
  else false

let win a b =
  if ((a < 1) || (a > 5)) && ((b < 1) || (b > 5)) 
    then 0 
else if (((a < 1) || (a > 5)) && ((b >= 1) && (b <= 5))) || 
 ( (((a >= 1) && (a <= 5)) && ((b >= 1) && (b <= 5))) && ((is_even (a + b))  == false) ) then (-1) 
else 1