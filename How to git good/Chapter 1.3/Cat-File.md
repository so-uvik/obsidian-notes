Luckily, Git has a built-in plumbing command, [cat-file](https://git-scm.com/docs/git-cat-file), that allows us to see the contents of a commit without needing to futz around with the object files directly.

```bash
git cat-file -p <hash>
```

# Trees and Blobs

Now that we understand some of our plumbing equipment, let's get into the pipes. Here are some terms to know:

- `tree`: git's way of storing a directory
- `blob`: git's way of storing a file

If you put in your latest commit hash here, you'll see that it outputs out something like this:

```bash
tree 5b21d4f16a4b07a6cde5a3242187f6a5a68b060f
author so-uvik <souviksahamay27@gmail.com> 1757830160 +0530
committer so-uvik <souviksahamay27@gmail.com> 1757830160 +0530

A: add contents.md
```

Notice that we can see:

- The `tree` object
- The `author`
- The `committer`
- The commit message

However, we _cannot_ see the contents of the `contents.md` file itself! That's because the `blob` object stores it.


Use `git cat-file -p` again, but this time with the hash of the `tree` object instead of the commit hash. You should see a `blob` object with _its_ own hash.

Use `cat-file` _again_, using the `blob` object's hash to view its contents.
