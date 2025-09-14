# New Branch

You should already be on the `main` branch: your "default" branch. You can always check with `git branch`.

## Two Ways to Create a Branch

```bash
git branch my_new_branch
```

This creates a new branch called `my_new_branch`. The thing is, I rarely use this command because usually I want to create a branch and switch to it immediately. So I use this command instead:

```bash
git switch -c my_new_branch
```

The [switch](https://git-scm.com/docs/git-switch) command allows you to switch branches, and the `-c` flag tells Git to create a new branch if it doesn't already exist.

When you create a new branch, it uses the _current commit_ you are on as the branch base. For example, if you're on your `main` branch with 3 commits, `A`, `B`, and `C`, and then you run `git switch -c my_new_branch`, your new branch will look like this:

![](https://storage.googleapis.com/qvault-webapp-dynamic-assets/course_assets/oah2FRD-1228x682.png)

# Switching Branches

We talked about using [git switch](https://git-scm.com/docs/git-switch) to change branches. There's another command that you'll certainly run into because it's been around for a long time and older developers are used to it: [git checkout](https://git-scm.com/docs/git-checkout). `git switch` is a newer command that is meant to be more intuitive and user-friendly. It's recommended to use `git switch` over `git checkout` for simply switching branches.

To switch to a branch called `prime`:

```bash
git switch prime

# or, the old way:
git checkout prime
```