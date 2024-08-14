function up-merge-sync
    set pr $argv[1]

    gh pr update-branch $pr --rebase
    and gh pr merge $pr --merge
    and git stash
    and git switch main
    and gt sync
    and gt submit --stack --update-only
    and git switch -
    and git stash pop
end

