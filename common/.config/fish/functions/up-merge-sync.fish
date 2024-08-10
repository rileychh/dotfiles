function up-merge-sync
    set pr $argv[1]

    gh pr update-branch $pr --rebase
    and gh pr merge $pr -md
    and git switch main
    and gt sync
    and git switch -
end

