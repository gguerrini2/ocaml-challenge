(*# Enumeration of integers

Write a function with type
```ocaml
val enum_int : int -> int = <fun>
```
which maps each natural number to an integer,
producing the following enumeration:

0   -1   1   -2   2   -3   3   ...

Your function must pass the test:
```ocaml
assert (List.init 10 enum_int = [0; -1; 1; -2; 2; -3; 3; -4; 4; -5]);;
```*)

let enum_int x =  match x with 
|0 -> 0
|n when n mod 2 = 1 -> ((-1)*(n+1))/2
|_ -> x/2;;

assert (List.init 10 enum_int = [0; -1; 1; -2; 2; -3; 3; -4; 4; -5]);;