type season = Spring | Summer | Autumn | Winter

let squirrel_play temp seas =
  if (temp >= 15 && temp <= 30) then true
  else if (temp >= 15 && temp <= 35) && seas == Summer then true
  else false