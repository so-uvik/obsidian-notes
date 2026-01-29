## What Is a Worktree?

A worktree (or "working tree" or "working directory") is just the directory on your filesystem where the code you're tracking with Git lives. Usually, it's just the root of your Git repo (where the `.git` directory is). It contains:

- Tracked files (files that Git knows about)
- Untracked files (files that Git doesn't know about)
- Modified files (files that Git knows about that have been changed since the last commit)

## The Worktree Command

Git has the [`git worktree` command](https://git-scm.com/docs/git-worktree) that allows us to work with worktrees. The first subcommand we'll worry about is simple:

```sh
git worktree list
```

It lists all the worktrees you created.
