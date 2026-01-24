Every dev team will have different standards and opinions on how to use Git. Some teams require all pull requests to contain a single commit, while others prefer to see a series of small, focused commits.

If you join a team that prefers a single commit, you will need to know how to "squash" your commits together. To be fair, even if you don't _need_ a single commit, squashing is useful to keep your commit history clean.

## What Is Squashing?

It's exactly what it sounds like. We take all the changes from a series of commits and squash them into a single commit.

![](https://storage.googleapis.com/qvault-webapp-dynamic-assets/course_assets/EeSnkk5-1280x629.png)

# How to Squash

Perhaps confusingly, squashing is done with the `git rebase` command! Here are the steps to squash the last `n` commits:

1. Start an interactive rebase with the command `git rebase -i HEAD~n`, where `n` is the number of commits you want to squash.
2. Git will open your default editor with a list of commits. Change the word `pick` to `squash` for all but the first commit.
3. Save and close the editor.

The `-i` flag stands for "interactive," and it allows us to edit the commit history before Git applies the changes. `HEAD~n` is how we reference the last `n` commits. `HEAD` points to the current commit (as long as we're in a clean state) and `~n` means "n commits before HEAD."

>[!Info]
>One thing to keep in mind is that, when the editor opens the commits, it is displayed in a _reverse_ order. The older commits appear first and the newer commits appear afterwards.
>
>And you'll see a comment below in the editing space that says, `s[squash]: will meld the commit into the previous commit.` Make sure to remember that commits are in _reverse_ order and previous commit will be the commit that's above it, and not below.

## Why Does Rebase Squash?

Remember, `rebase` is all about replaying changes. When we rebase onto a specific _commit_ (`HEAD~n`), we're telling Git to replay all the changes from the _current_ branch on top of that commit. Then we use the interactive flag to "squash" those changes so that Rebase will apply them all in a single commit.

## Rebase does not just squash
If all you're doing during a `rebase` is replaying commits, you can do much more than just squashing.

You can:
-  Squash some commits and leave others.
-  Split a commit into multiple commits.
-  Drop/Delete a commit.
-  Re-order commits.
-  Change multiple commit messages.
  
  All of the ways you can do this is well documented in the git-scm website, have a look if you're curious.
  [https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History]

There's also a helpful video if you're trying to understand all of the possible options that git gives you.
[https://www.youtube.com/watch?v=H7RFt0Pxxp8]