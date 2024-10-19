type weekday = Mo | Tu | We | Th | Fr

type course = ALF | LIP

let isLecture (d: weekday) (c: course) =
  if ((d == Tu || d == Th || d == Fr) && c == ALF ) then true
  else if ((d == We || d == Th) && c == LIP ) then true 
else false
