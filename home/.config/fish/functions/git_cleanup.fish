function git_cleanup
  for branch in (git branch -vv | grep ' gone' | cut -d' ' -f1-3 | sed -e 's/^[ \t]*//')
    if user_prompt "Remove deleted branch $branch?"
      git branch -D $branch
    end
  end
end

