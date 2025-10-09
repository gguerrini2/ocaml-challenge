(*# Blood donations

There are four blood groups, `A`, `B`, `AB` and `O`:

```ocaml
type blood_group = A | B | AB | O
```

A blood donation is possible only if the blood group of the donor is compatible with the blood group of the recipient.

The compatibility relation is illustrated in the directed graph below, where an edge from `x` to `y` indicates that a patient with blood group `x` can 
give blood to a patient with blood group `y`.

![image](graph.png)

Define a function `check_groups` that takes the blood groups of two different patients and checks if the first patient can donate blood to the second 
patient. The type must be:

```ocaml
check_groups : blood_group -> blood_group -> bool
```

For example, the following asserts must pass:
```ocaml
assert (check_groups O AB = true);;
assert (check_groups A B = false);;
assert (check_groups AB AB = true);;
```*)

type blood_group = A | B | AB | O;;

let check_groups d r = match (d, r) with 
|(A, A) -> true 
|(A, AB) -> true 
|(AB, AB) -> true 
|(B, B) -> true
|(B, AB) -> true 
|(O, O) -> true 
|(O, AB) -> true 
|(O, A) -> true 
|(O, B) -> true 
|_ -> false;;

assert (check_groups O AB = true);;
assert (check_groups A B = false);;
assert (check_groups AB AB = true);;