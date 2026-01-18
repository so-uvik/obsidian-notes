A common complaint about rebase is that there are times when you may have to manually resolve the same conflicts over and over again. This is especially prevalent when you have a long-running feature branch, or even more likely, multiple feature branches that are being rebased onto `main`.

## RERERE to the Rescue

> The [git rerere](https://git-scm.com/book/en/v2/Git-Tools-Rerere) functionality is a bit of a hidden feature. The name stands for “reuse recorded resolution” and, as the name implies, it allows you to ask Git to remember how you’ve resolved a hunk conflict so that the next time it sees the same conflict, Git can resolve it for you automatically.

In other words, if enabled, `rerere` will remember how you resolved a conflict (applies to rebasing but also merging) and will automatically apply that resolution the next time it sees the same conflict. Pretty neat, right?

You can enable rerere locally using the following command:

```shell
git config set --local rerere.enabled true
```

>[!Tip]
>ReReRe maintains a cache of recorded resolutions, if you ever want to delete the cache you can do so with `rm -rf .git/rr-cache`




