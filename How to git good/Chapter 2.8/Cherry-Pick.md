
There comes a time in every developer's life when you want to yoink a commit from a branch, but you don't want to merge or rebase because you don't want _all_ the commits.

The [`git cherry-pick` command](https://git-scm.com/docs/git-cherry-pick) solves this.

```sh
git cherry-pick <commit-hash>
```