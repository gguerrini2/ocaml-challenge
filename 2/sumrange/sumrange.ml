(*"# Sum range

Define a function with type:
```ocaml
sumrange : int -> int -> int
```
such that `sumrange a b` sums the numbers in the range `[a,b]`.
If the range is empty, then the result is zero.

For instance, the following `assert` pass:
```ocaml
assert (sumrange 0 1 = 1);;

assert (sumrange 1 3 = 6);;

assert (sumrange 3 2 = 0);;
```"*)

let gauss x y = (x+y) * ((y - x + 1) / 2);;

let sumrange x y = if(x < y) then 
  if(y mod 2 = 0) then (gauss x y) else (gauss x (y-1)) + y 
else 0;;