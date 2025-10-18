(*# Characteristic functions

Given a set A of elements in a domain U, its **characteristic function** $\chi_A$ is defined as follows:
- $\chi_A(x) = 1$ if $x \in A$
- $\chi_A(x) = 0$ if $x \not\in A$

Implement the characteristic function of the following sets, where the universe is the set of natural numbers. 

For each item i in the list, the functions must have type:
```ocaml
fi : int -> int
```
The functions must be undefined on the negative integers: you can use the `failwith` construct for this purpose.

1. ∅
1. {0, 1, 2}
1. {x | 0 < x < 100}
1. {x | false }
1. {x | ∀y. x + y ≥ x}
1. {x | ∃y. x = y + y}
1. {x | ∃y. y = x + x}
1. {x | ∃y. x < y}
1. {x | ∃y. x * x = y}
1. {x | ∃y. y < 3 ∧ 7 < x y < 20 }
1. {x | x < 50 ∧ ∃y. x = y + y}
1. {z | ∃x. z = 2 x ∧ 0 < 2x < 50 }
1. {z | ∃x, y. z = x + y ∧ x * y ≤ 20}
1. {x | ∀y. y < x → y < 2 }
1. {x | ∀y. (x mod y = 0) → (y=1 ∨ y=x) }*)

let negative () = failwith "Not a positive number";;

let fi1 x = if x < 0 then negative() else 0;;
let fi2 x = if x < 0 then negative() else if (x = 0 || x = 1 || x = 2) then 1 else 0;;
let fi3 x = if x < 0 then negative() else if (x > 0 && x < 100) then 1 else 0;;
let fi4 x = if x < 0 then negative() else if (false) then 1 else 0;;
let fi5 x = if x < 0 then negative ()else 1;;
let fi6 x = if x < 0 then negative() else if(x mod 2 = 0) then 1 else 0;;
let fi7 x = if x < 0 then negative() else 1;;
let fi8 x = if x < 0 then negative() else 1;;
let fi9 x = if x < 0 then negative() else 1;;
let fi10 x = if x < 0 then negative() else if(x > 7 && x < 20) || (x*2 > 7 && x*2 < 20) then 1 else 0;;
let fi11 x = if x < 0 then negative() else if(x < 50 && fi6 x = 1) then 1 else 0;;
let fi12 z = if z < 0 then negative() else if(z mod 2 = 0) && (0 < z && z < 50) then 1 else 0;; (* 12. {z | ∃x. z = 2x ∧ 0 < 2x < 50} — numeri pari positivi minori di 50 *)
let fi13 z = if z < 0 then negative() else if(z <= 21) then 1 else 0;;
let fi14 x = if x < 0 then negative() else if(x <= 2) then 1 else 0;;



(* 1. ∅ — insieme vuoto *)
assert (fi1 0 = 0);;
assert (fi1 10 = 0);;

(* 2. {0, 1, 2} *)
assert (fi2 0 = 1);;
assert (fi2 1 = 1);;
assert (fi2 2 = 1);;
assert (fi2 3 = 0);;

(* 3. {x | 0 < x < 100} *)
assert (fi3 0 = 0);;
assert (fi3 1 = 1);;
assert (fi3 99 = 1);;
assert (fi3 100 = 0);;

(* 4. {x | false} — sempre falso *)
assert (fi4 0 = 0);;
assert (fi4 999 = 0);;

(* 5. {x | ∀y. x + y ≥ x} — sempre vero per numeri naturali *)
assert (fi5 0 = 1);;
assert (fi5 10 = 1);;

(* 6. {x | ∃y. x = y + y} — numeri pari *)
assert (fi6 0 = 1);;
assert (fi6 2 = 1);;
assert (fi6 3 = 0);;
assert (fi6 10 = 1);;

(* 7. {x | ∃y. y = x + x} — nessun numero naturale soddisfa y = x + x? No, tutti x hanno un y=2x → sempre vero *)
assert (fi7 0 = 1);;
assert (fi7 5 = 1);;

(* 8. {x | ∃y. x < y} — ogni numero naturale ha un y maggiore → sempre vero *)
assert (fi8 0 = 1);;
assert (fi8 999 = 1);;

(* 9. {x | ∃y. x * x = y} — sempre vero, basta y = x*x *)
assert (fi9 0 = 1);;
assert (fi9 7 = 1);;

(* 10. {x | ∃y. y < 3 ∧ 7 < x*y < 20} *)
assert (fi10 0 = 0);;
assert (fi10 3 = 0);;  (* perché y=2 → 7<6<20 è falso, ma per y=2 e x=3 → 6<20, no; per y=2 e x=5 → 10<20 vero, quindi fi10 5=1 *)
assert (fi10 5 = 1);;
assert (fi10 10 = 1);;

(* 11. {x | x < 50 ∧ ∃y. x = y + y} — numeri pari minori di 50 *)
assert (fi11 0 = 1);;
assert (fi11 2 = 1);;
assert (fi11 49 = 0);;
assert (fi11 50 = 0);;

(* 12. {z | ∃x. z = 2x ∧ 0 < 2x < 50} — numeri pari positivi minori di 50 *)
assert (fi12 0 = 0);;
assert (fi12 2 = 1);;
assert (fi12 48 = 1);;
assert (fi12 50 = 0);;
assert (fi12 51 = 0);;

(* 13. {z | ∃x, y. z = x + y ∧ x*y ≤ 20} *)
assert (fi13 0 = 1);;   (* x=0, y=0 → 0+0=0 *)
assert (fi13 10 = 1);;  (* x=5,y=5 → prodotto=25, no; ma x=4,y=6→24, no; x=2,y=8→16 sì → z=10 valido *)
assert (fi13 50 = 0);;

(* 14. {x | ∀y. y < x → y < 2} → solo x ≤ 2 *)
assert (fi14 0 = 1);;
assert (fi14 1 = 1);;
assert (fi14 2 = 1);;
assert (fi14 3 = 0);;
assert (fi14 10 = 0);;