(*# Straight

Consider the following types to represent French-suited cards:
```ocaml
type suit = S | H | D | C;;
type card = Card of int * suit;;
```

Write a function with type:
```ocaml
straight : card * card * card * card * card -> bool
```
which evaluates to true iff the hand contains a straight,
namely five cards in sequential order, possibly with different suites.*)

type suit = S | H | D | C;;
type card = Card of int * suit;;

let assignation x = match x with
|0 -> S
|1 -> H
|2 -> D
|_ -> C;;

let rndCard () = Card ((((Random.int 10) mod 10) + 1), assignation(Random.int 4));;

let rndHand () = rndCard(), rndCard(), rndCard(), rndCard(), rndCard();;
(*
let succPrec v a b c d = if ((v = a + 1) || (v = a - 1)) || 
  ((v = b + 1) || (v = b - 1)) ||
  ((v = c + 1) || (v = c - 1)) ||
  ((v = d + 1) || (v = d - 1)) then true else false;;

let straight (Card(v1, s1), Card(v2, s2), Card(v3, s3), Card(v4, s4), Card(v5,s5)) =
  succPrec(v1 v2 v3 v4 v5)  && 
  succPrec(v2 v1 v3 v4 v5) &&
  succPrec(v3 v2 v1 v4 v5) &&
  succPrec(v4 v2 v3 v1 v5) &&
  succPrec(v5 v2 v3 v4 v1);;
*)

let min x y = if(x < y) then x else y;;

let min5 a b c d e =  min (min (min a b) (min b c)) (min d e);;

let max x y = if(x > y) then x else y;;

let max5 a b c d e =  max (max (max a b) (max b c)) (max d e);;

let succPrec (Card(v1, s1), Card(v2, s2), Card(v3, s3), Card(v4, s4), Card(v5,s5)) = 
  if(((v1 = v2 + 1) || (v1 = v2 - 1)) ||
    ((v1 = v3 + 1) || (v1 = v3 - 1)) ||
  ((v1 = v4 + 1) || (v1 = v4 - 1)) ||
  ((v1 = v5 + 1) || (v1 = v5 - 1))) && 
  ((max5 v1 v2 v3 v4 v5) - (min5 v1 v2 v3 v4 v5)) = 4 then true else false;;

let straight (c1, c2, c3, c4, c5) = 
  succPrec(c1, c2, c3, c4, c5) &&
  succPrec(c2, c1, c3, c4, c5) &&
  succPrec(c3, c2, c1, c4, c5) &&
  succPrec(c4, c2, c3, c1, c5) &&
  succPrec(c5, c2, c3, c4, c1);;

straight (rndHand());;
straight (Card(5,S),Card(4,H),Card(7,D),Card(6,C),Card(3,C));;
straight (Card(5,S),Card(4,H),Card(7,D),Card(6,C),Card(8,C));;
straight (Card(5,S),Card(4,H),Card(7,D),Card(6,C),Card(2,C));;
straight (Card(2,S),Card(3,H),Card(5,D),Card(6,C),Card(7,C));;