let best_offer (x: int option) (y: int option) (z: int option) =
  match x, y, z with
  |(None, None, None) -> None
  |(Some v, None, None) | (None, Some v, None) | (None, None, Some v) -> Some v
  |(Some va, Some vb, None) -> Some (max va vb)
  |(Some va, None, Some vb) -> Some (max va vb)
  |(None, Some va, Some vb) -> Some (max va vb)
  |(Some va, Some vb, Some vc) -> Some (max(max va vb) vc)