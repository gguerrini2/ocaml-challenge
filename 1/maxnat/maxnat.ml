let maxnat (a: int) (b: int) =
  if ((a < 0) || (b < 0)) 
    then failwith("a and b must be natural") 
else
  if (a > b) then a 
  else 
    b

let () = assert(maxnat 2 5 = 5);;
assert(maxnat 5 2 = 5);;
assert(try maxnat (-2) 5 |> fun _ -> false with _ -> true);;
assert(try maxnat 2 (-5) |> fun _ -> false with _ -> true);;
assert(try maxnat (-2) (-5) |> fun _ -> false with _ -> true);;