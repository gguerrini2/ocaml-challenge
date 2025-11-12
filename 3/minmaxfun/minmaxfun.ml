(*# Min and max of a function

Recall the built-in option type:
```ocaml
type 'a option = Some of 'a | None
```

Write a function with the following type:
```ocaml
minmaxfun : (int -> 'a) -> int -> int -> ('a * 'a) option
```
such that ``minmaxfun f a b`` computes the minimum and the maximum
of f in the range [a,b].
If the range is empty, then the function evaluates to ``None``.*)

let rec minmaxfun f a b = 
  if a>b then None
  else match minmaxfun f (a+1) b with
      None -> Some (f a,f a)
    | Some (n,m) ->
      let n' = if (f a) < n then f a else n
      and m' = if (f a) > m then f a else m
      in Some (n',m')
;;