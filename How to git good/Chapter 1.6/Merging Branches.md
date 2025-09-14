# Merge

"What's the point of having multiple branches?" you might ask. They're most often used to safely make changes without affecting your (or your _team's_) primary branch. However, once you're happy with your changes, you'll want to [merge](https://git-scm.com/docs/git-merge) them back into the main branch so that they make their way into the final product.

## Visual

Let's say you're in a state where you have two branches, each with their own unique commits:

```
A - B - C    main
   \
    D - E    other_branch
```

If you merge `other_branch` into `main`, Git combines both branches by creating a new commit that has _both_ histories as parents. In the diagram below, `F` is a [merge commit](https://git-scm.com/docs/git-merge#_true_merge) that has `C` and `E` as parents. `F` brings all the changes from `D` and `E` back into the `main` branch.

```
A - B - C - F    main
   \     /
    D - E        other_branch
```

