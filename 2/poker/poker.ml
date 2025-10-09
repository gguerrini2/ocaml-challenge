(*# Poker

Consider the following types to represent French-suited cards:
```ocaml
type suit = S | H | D | C;;
type card = Card of int * suit;;
```

Write a function with type:
```ocaml
rndHand : unit -> card * card * card * card * card
```
which generates a random hand of 5 cards.

Then, write a function with type:
```ocaml
poker : card * card * card * card * card -> bool
```
which evaluates to true iff the hand contains a poker,
namely if there are four cards with the same value but different suites.*)

Random.self_init();;

type suit = S | H | D | C;;
type card = Card of int * suit;;

let assignation x = match x with
|0 -> S
|1 -> H
|2 -> D
|_ -> C;;

let rndCard () = Card ((((Random.int 10) mod 10) + 1), assignation(Random.int 4));;

let rndHand () = rndCard(), rndCard(), rndCard(), rndCard(), rndCard();;

let poker4 (Card(v1, s1), Card(v2, s2), Card(v3, s3), Card(v4, s4)) =
  if((v1 = v2 && v2 = v3 && v3 = v4) && (s1 <> s2 && s2 <> s3 && s3 <> s4)) then true else false;;

let poker (c1,c2,c3,c4,c5) =
  poker4 (c1,c2,c3,c4) ||
  poker4 (c1,c2,c3,c5) ||
  poker4 (c1,c2,c4,c5) ||  
  poker4 (c1,c3,c4,c5) ||  
  poker4 (c2,c3,c4,c5)
;;