(*# Tris

Write a function with type:
```ocaml
tris : 'a * 'a * 'a * 'a -> bool
```
such that `tris (a,b,c,d)` is true iff at least three elements of the quadruple `(a,b,c,d)` are equal.

Then, test the function through a function with type:
```ocaml
hand : unit -> int * int * int * int
```
which generates a random quadruple of elements in the range 1..10.*)

Random.self_init();;

let tris (a, b, c, d) = match (a, b, c, d) with
|(a, b, c, d) when (a = b && b = c && c = d) || (a = b && b = c ) || (b = c && c = d) || (a = c && c = d) || (a = b && b = d) -> true
|_ -> false;;

let rndValue () = ((Random.int 10) mod 10) + 1;

let hand () = rndValue(), rndValue(), rndValue(), rndValue();;