type card = Joker | Val of int;;

let win p d = match p, d with
|Joker, Joker -> false 
|Val a, Joker -> false
|Joker, Val a -> true
|Val a, Val b -> if a > b then true else false 