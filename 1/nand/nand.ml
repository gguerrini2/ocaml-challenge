let a = true;;

let b = false;;

let nand a b = not (a && b);;

let nand2 (a : bool) (b : bool) :
bool = if a
  then (*[a] is true*)
    (if b
      then (*[b] is true*) false
  else true)

else(*[a] is false*)
false