A merge conflict occurs when two commits _modify the same line_ and Git can't automatically decide which change to keep and which change to discard.

Consider the following commit history:

```bash
    C     feature
  /
A - B     main
```

The `main` branch has a file with these lines:

```go
package main

func isNice(num int) bool {
    return num == 69 // commit B changed this line
}
```

While `feature` has:

```go
package main

func isNice(num int) bool {
    return num == 420 // commit C changed this line
}
```

If we merge `feature` into `main`, Git will detect that the `return` line was changed in both branches independently: which creates a [conflict](https://git-scm.com/docs/git-merge#_how_to_resolve_conflicts).

When a conflict happens (usually as the result of a `merge` or `rebase`) Git will prompt you to _manually_ decide which change to keep. It's okay when the same line is modified in one commit, and then again in a _later_ commit. The problem arises when the same line is modified in two commits that aren't in a parent-child relationship.

# Edit the File

Resolving conflicts is a manual process. When they happen, Git marks the conflicted files and asks you to resolve the conflict by editing the files in your editor.

If you encounter a conflict, run `git status` to see which file is causing the conflict.

If you open that file in your editor of choice, you'll see conflict markers like this surrounding your code. 

You should see a nasty bit of text that looks like this:

```
first_name,last_name,company,title
<<<<<<< HEAD
karson,yummy,intercooler,ceo
=======
jayson,gross,htmz,contributor
>>>>>>> main
```

Your editor might even highlight the conflict markers to make it easier to see, but at the end of the day, it's just text. The top section, between the `<<<<<<< HEAD` and `=======` lines, is _our_ branch's version of the file. The bottom section, between the `=======` and `>>>>>>> main` lines, is the version of the file that's on the `main` branch ("theirs" ).

In many cases, you might want to keep one change and discard the other. That's common when you're dealing with code changes. 

# Resolution

After manually editing any conflicting files (sometimes it's more than one file or more than one section of a file) you need to simply `add` and `commit` the changes. This tells Git that you've resolved the conflict and it can continue with the merge.


>[!Caution]
>Git will let you commit conflict markers, so check you removed them all before you continue with a merge.

# Ours and Theirs

In a merge conflict:

- **"Ours"** refers to the branch you are on (merging into)
- **"Theirs"** refers to the branch being merged

```bash
# you're on the "ours" branch, the "theirs" branch is "their_branch"
git merge their_branch
```

## Checkout Conflict
Git has some built-in tools to help with checking out individual conflicts i.e either "there's" or "our's".

The [`git checkout` command](https://www.git-scm.com/docs/git-checkout) can checkout the individual changes during a merge conflict using the `--theirs` or `--ours` flags.

- `--ours` will overwrite the file with the changes from the branch you are currently on and merging into
- `--theirs` will overwrite the file with the changes from the branch you are merging into the current branch

```bash
git checkout --theirs path/to/file
```