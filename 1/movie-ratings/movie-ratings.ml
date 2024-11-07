let movie_ratings f s t =
  if(f < 1 || f > 5) || (s < 1 || s > 5) || (t < 1 || t > 5) then
    failwith("Un valore non è ammesso ") else 
      if (f == 5 && s == 5 && t == 5) then 
        "Masterpiece" 
else if (f == 5 && s == 5 && t == 4) || 
        (f == 5 && s == 4 && t == 5) ||
        (f == 4 && s == 5 && t == 5) then 
        "Highly Recommended" 
else if (f >= 4 && s >= 4 && t >= 3) ||
        (f >= 4 && s >= 3 && t >= 4) ||
        (f >= 3 && s >= 4 && t >= 4) then 
        "Recommended" else
          "Mixed Reviews"