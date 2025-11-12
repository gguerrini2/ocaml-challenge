(*# Has One

Write a function with type:
```ocaml
has_one : int -> bool
```
For a positive integer n, `has_one n` returns true if n contains a 1 digit.
If n is negative, then the function must fail.

For instance, the following asserts must pass:
```ocaml
assert(has_one 10 = true);;
assert(has_one 220 = false);;
assert(has_one 911 = true);;
assert(has_one 451 = true);;
assert(try has_one (-1) |> fun _ -> false with _ -> true);;
```*)

let rec has_one n =
  if n<0 then failwith "Error"
  else if n mod 10 = 1 then true
  else if n<10 then false
  else has_one (n/10)
;;