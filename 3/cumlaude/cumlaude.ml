(*# Student grades

Consider the following type to represent student grades:
```ocaml
type grade = Val of int | CumLaude;;
```
Write functions with the following types:
```ocaml
is_valid : grade -> bool
```
which evaluates to true iff the grade is included between 18 and 30, or it is ``CumLaude``.

```ocaml
int_of_grade : grade -> int
```
which transforms a valid grade into an integer (where ``CumLaude`` counts for 32), and fails if the grade is not valid.

```ocaml
avg : grade list -> float
```
which computes the average of a list of valid grades (it fails if some grade in the list is not valid).
*)

type grade = Val of int | CumLaude;;

let is_valid grade = match grade with 
| Val x when x > 17 && x <= 30 -> true 
| CumLaude -> true
| _ -> false;;

let int_of_grade grade = if(is_valid(grade)) then 
  match grade with 
  |Val x -> x
  |CumLaude -> 32
else failwith("Grade not valid");;

let rec calc_avg list sum n = match (list, n) with 
| [], x when x > 0 -> float_of_int sum /. float_of_int x
| [], _ -> 0.0
| x::rest, _ when is_valid(x)=false -> failwith("Grade not valid")
| x::rest, _ -> calc_avg (rest) (sum + int_of_grade x) (n + 1);;


let rec avg grade_list = calc_avg grade_list 0 0;;


assert (avg [Val 18; Val 24; Val 30] = 24.0);;
assert (avg [CumLaude] = 32.0);;
assert (avg [Val 30; CumLaude] = 31.0);;
assert (avg [] = 0.0);;
assert (try let _ = avg [Val 10; Val 28] in false with Failure _ -> true);;
