(*# Loaded dice

Write a function with type:
```ocaml
dice : int -> int
```
which throws a loaded dice, where the probability of a 6 is specified by the argument (in percentage),
while the other sides are uniform.
For instance, `dice 80` will throw a loaded dice where the probability of 6 is 80%,
while the probability of the other sides is 4%.*)

let percentage () = (Random.int 100) mod 100 + 1;;

let others () = Random.int 5 mod 5 + 1;;

let dice x = if(percentage() <= x) then 6 else others();;