(*# Bounce

Define a function with type:
```ocaml
bounce : int -> int -> int
```
The function takes as input an integer, and it outputs
a function from integers to integers.
The output function `bounce n` is periodic with period 2 n,
and it has the behaviour described by the following graph (with n=3).

![image](bounce.png)*)
let seq x n = abs(x mod (n*2));;
let bounce n = fun x -> if seq x n < n then seq x n else n - ((seq x n) - n);; 

assert(bounce 3 0 = 0);;
assert(bounce 3 1 = 1);;
assert(bounce 3 2 = 2);;
assert(bounce 3 3 = 3);;
assert(bounce 3 4 = 2);;
assert(bounce 3 5 = 1);;
assert(bounce 3 6 = 0);;
assert(bounce 3 7 = 1);;
assert(bounce 3 8 = 2);;
assert(bounce 3 9 = 3);;

assert(bounce 4 0 = 0);;
assert(bounce 4 3 = 3);;
assert(bounce 4 4 = 4);;
assert(bounce 4 5 = 3);;
assert(bounce 4 6 = 2);;
assert(bounce 4 7 = 1);;
assert(bounce 4 8 = 0);;

assert(bounce 2 0 = 0);;
assert(bounce 2 1 = 1);;
assert(bounce 2 2 = 2);;
assert(bounce 2 3 = 1);;
assert(bounce 2 4 = 0);;
assert(bounce 2 5 = 1);;
