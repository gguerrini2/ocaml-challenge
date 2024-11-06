type vote = StrongReject |WeakReject |WeakAccept | StrongAccept

let decide_exam first second third =
  if(first == StrongReject || second == StrongReject || third == StrongReject) then false
  else if ( (first == WeakAccept) || (first == StrongAccept) ) && ((second == WeakAccept) || (second == StrongAccept) ) then true
  else if ( (first == WeakAccept) || (first == StrongAccept) ) && ((third == WeakAccept) || (third == StrongAccept) ) then true
  else if ( (third == WeakAccept) || (third == StrongAccept) ) && ((second == WeakAccept) || (second == StrongAccept) ) then true
  else false