(*if*)
let mux2 (s0 : bool) (a : bool) (b : bool) = 
  if s0 then a else b

(*logical connectives*)
let mux2lc (s0 : bool) (a : bool) (b : bool) =
  not ((not (a && s0)) && (not ((not s0) && b)) )

(*pattern matching*)
let mux2pm (s0 : bool) (a: bool) (b : bool) =
  match(s0) with
  | (true) -> a
  | (false) -> b

let mux4 s0 s1 a0 a1 a2 a3 = 
  mux2 s1 (mux2 s0 a0 a1) (mux2 s0 a2 a3) 

let () = 
assert(mux4 false false false true false true = false);;
assert(mux4 false true false true false true = true);;
assert(mux4 true false false true false true = false);;
assert(mux4 true true false true false true = true);;