(*# Consecutive even

Define a function with type:
```ocaml
consecutive_even : int list -> int
```
such that `consecutive_even l` gives the length of the longest subsequence of `l` containing only even numbers.

For instance, the function must pass the following asserts:
```ocaml
assert(consecutive_even [] = 0);;
assert(consecutive_even [1;2;3;4;5;6] = 1);; 
assert(consecutive_even [1;2;2;3;4;5] = 2);;
assert(consecutive_even [1;2;3;4;2;5] = 2);;
assert(consecutive_even [1;2;2;3;4;2;5] = 2);;
assert(consecutive_even [1;2;2;2;3;4;2;6;5] = 3);;
```*)

let is_even x = if x mod 2 = 0 then true else false;;

let rec confronts f cur max = match (f, cur, max) with 
| [], _, _ -> max 
| [_], _, _ -> max
| x::y::rest, _, _ when is_even x && is_even y && (cur+1) < max -> confronts(y::rest) (cur + 1) max
| x::y::rest, _, _ when is_even x && is_even y && (cur+1) >= max -> confronts(y::rest) (cur + 1) (cur + 1)
| x::y::rest, _, _ when is_even x && is_even y = false && (cur+1) >= max -> confronts(y::rest) (cur+1) (cur+1)
| x::rest, _, _ ->  confronts(rest) (0) max;;

let consecutive_even l = confronts l 0 0;;
consecutive_even [1;2;3;4;5;6];;
assert(consecutive_even [] = 0);;
assert(consecutive_even [1;2;3;4;5;6] = 1);; 
assert(consecutive_even [1;2;2;3;4;5] = 2);;
assert(consecutive_even [1;2;3;4;2;5] = 2);;
assert(consecutive_even [1;2;2;3;4;2;5] = 2);;
assert(consecutive_even [1;2;2;2;3;4;2;6;5] = 3);;