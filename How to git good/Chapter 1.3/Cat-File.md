Luckily, Git has a built-in plumbing command, [cat-file](https://git-scm.com/docs/git-cat-file), that allows us to see the contents of a commit without needing to futz around with the object files directly.

```bash
git cat-file -p <hash>
```

