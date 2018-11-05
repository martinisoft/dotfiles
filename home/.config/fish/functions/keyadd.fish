function keyadd --argument-names 'hours' --description "Add the key to the SSH agent for so many hours (default 6)"
  if test -n "$hours"
    ssh-add -t"$hours"h ~/.ssh/id_rsa
  else
    ssh-add -t6h ~/.ssh/id_rsa
  end
end

