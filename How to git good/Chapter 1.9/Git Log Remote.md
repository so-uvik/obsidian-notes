# Log Remote

The `git log` command isn't only useful for your _local_ repo. You can log the commits of a _remote_ repo as well!

```bash
git log remote/branch
```

For example, if you wanted to see the commits of a branch named `primeagen` from a remote named `origin` you would run:

```bash
git log origin/primeagen
```

# Merge

Just as we merged branches within a single local repo, we can also merge branches between local and remote repos.

## Syntax

```bash
git merge remote/branch
```

For example, if you wanted to merge the `primeagen` branch of the remote `origin` into your local `main` branch, you would run this inside the local repo while on the `main` branch:

```bash
git merge origin/primeagen
```

