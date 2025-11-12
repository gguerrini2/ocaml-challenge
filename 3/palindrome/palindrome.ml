(*# Palindrome

Write a function `is_palindrome` that checks if a list is palindrome.
A list is palindrome when it reads the same backwards as forwards.

The function must have the following type:
```ocaml
is_palindrome : 'a list -> bool
```

Here are some unit tests:
```ocaml
assert(is_palindrome []);;
assert(is_palindrome ['a';'n';'n';'a']);;
assert(is_palindrome ['r';'a';'d';'a';'r']);;
assert(is_palindrome ['a';'n';'n';'e'] = false);;
assert(is_palindrome ['z';'a';'n';'n';'a'] = false);;
```*)

let rec rev l = match l with 
| [] -> []
| x :: rest-> rev(rest)@[x];;

let rec same a b = match (a, b) with 
| ([], []) -> true
| (x::rest1, y::rest2) -> x = y && same rest1 rest2
| _ -> false;;


let is_palindrome l = same l (rev l);;

assert(is_palindrome []);;
assert(is_palindrome ['a';'n';'n';'a']);;
assert(is_palindrome ['r';'a';'d';'a';'r']);;
assert(is_palindrome ['a';'n';'n';'e'] = false);;
assert(is_palindrome ['z';'a';'n';'n';'a'] = false);;