let notfraction () = failwith"Invalid input";;

let isfrac ((x, y): int * int) = if (x = 0) then failwith"Not valid numerator" else true;;

let isposfrac ((a,  b) : int * int) = if(a = 0) then notfraction () else if a < b then true else false;; 

let rec mcd(x, y) = if(x mod y) = 0 then y else mcd(y, (x mod y)) ;;

let mcm (x, y) = (x * y) / mcd(x, y);;

let compare_posfrac (a, b) (c, d) = if (not (isposfrac(a, b)) || (not(isposfrac(c, d))) ) then notfraction() else 
  if(((a mod c) = 0 && (b mod d) = 0) || ((c mod a) = 0 && (d mod b) = 0) ) then 0 else 
  if (((mcm(b,d) / b) * a) > ((mcm(b,d) / d)*c) ) then 1 else -1;;

assert (compare_posfrac (1,2) (2,4) == 0);;
assert (compare_posfrac (1,2) (1,3) == 1);;
assert (compare_posfrac (1,2) (2,3) == -1);;

let compare_frac (a, b) (c, d) = if (not (isfrac(a, b)) || (not(isfrac(c, d))) ) then notfraction() else
  if(((mcm(b,d) / b) * a) = ((mcm(b,d) / d)*c) ) then 0 else 
  if (((mcm(b,d) / b) * a) > ((mcm(b,d) / d)*c) ) then 1 else -1;;



(* Frazioni uguali *)
assert (compare_frac (-1, 2) (1, -2) == 0);;     (* -1/2 = 1/(-2) *)

(* Prima maggiore *)
assert (compare_frac (3, 4) (2, 4) == 1);;       (* 3/4 > 2/4 *)
assert (compare_frac (1, 2) (-1, 2) == 1);;      (* 1/2 > -1/2 *)

(* Prima minore *)
assert (compare_frac (1, 3) (1, 2) == -1);;      (* 1/3 < 1/2 *)
assert (compare_frac (-1, 2) (1, 2) == -1);;     (* -1/2 < 1/2 *)
assert (compare_frac (1, -3) (1, -2) == -1);;    (* 1/(-3) < 1/(-2) *)

(* Denominatori diversi, segni misti *)
assert (compare_frac (-2, -4) (1, 2) == 0);;     (* -2/-4 = 1/2 *)
assert (compare_frac (-3, 4) (-2, 3) == -1);;    (* -3/4 < -2/3 *)
assert (compare_frac (-1, 4) (1, 3) == -1);;     (* -1/4 < 1/3 *)
                                                 
