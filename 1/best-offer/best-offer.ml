let best_offer (x: int option) (y: int option) (z: int option) =
  match x, y, z with
  |None, None, None -> None
  |