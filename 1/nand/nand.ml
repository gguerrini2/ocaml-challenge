let a = true;;

let b = false;;

(*connettivi logici*)
let nand a b = not (a && b);;

(*if*)
let nand2 (a : bool) (b : bool) :
bool = if a
  then (*[a] is true*)
    (if b
      then (*[b] is true*) false
  else true)

else(*[a] is false*)
false

(*pattern matching*)
let nand3 a b =
  match (a, b) with
  | (true, true) -> false
  | _ -> true