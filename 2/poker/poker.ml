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

let rndHand () = Card ((((Random.int 10) mod 10) + 1), assignation(Random.int 4)), 
Card ((((Random.int 10) mod 10) + 1), assignation(Random.int 4)),
Card ((((Random.int 10) mod 10) + 1), assignation(Random.int 4)),
Card ((((Random.int 10) mod 10) + 1), assignation(Random.int 4)),
Card ((((Random.int 10) mod 10) + 1), assignation(Random.int 4));;

let get_value c =
  match c with
  | Card (v, _) -> v;;

let getSuit c = 
  match c with
  | Card(_, s) -> s;;

let poker (a, b, c, d, e: card * card * card * card * card) = 
  if ((get_value a = get_value b && get_value b = get_value c && get_value c = get_value d && get_value d <> get_value e) && 
    (get))