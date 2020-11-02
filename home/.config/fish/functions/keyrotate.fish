function keyrotate --description "Rotates the SSH key by year for better security"
  set --local current_year (date +%Y)
  if ! test -f ~/.ssh/id_rsa_$current_year
    if user_prompt "Do you want to rotate your SSH key?"
      echo "Moving current key to ~/.ssh/id_rsa_$current_year"
      mv ~/.ssh/id_rsa ~/.ssh/id_rsa_$current_year
      mv ~/.ssh/id_rsa.pub ~/.ssh/id_rsa_$current_year.pub
      echo "Generating new SSH key"
      ssh-keygen -t rsa
    end
  end
end
