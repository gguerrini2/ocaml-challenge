(*logical connectives*)
let xor1 (a : bool) (b : bool) = 
  (a || b) && (not (a && b))

(*conditional expressions*)
let xor2 (a : bool) (b : bool) = 
  if ((a && (not b)) || ((not a) && b))
    then true
else 
  false

(*pattern matching*)
let xor3 (a : bool) (b : bool) =
  match (a, b) with
  | (true, false) -> true
  | (false, true) -> true
  | _ -> false
