Random.self_init ();;

let in_range x a b =
  if x >= a && x <= b then true else false
;;

let guess5 x = 
  let ran = Random.int(5) + 1 in
  if(in_range x 1 5) == false then failwith("Non è nel range")
  else 
    if ran == x then true, ran
    else false, ran