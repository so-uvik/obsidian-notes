# Tags

We're going to wrap this course up on an easy one: [tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging).

A tag is a name linked to a commit that doesn't move between commits, unlike a branch. Tags can be created and deleted, but not modified.

## How to Tag

To list all current tags:

```sh
git tag
```

To create a tag on the current commit:

```sh
git tag -a "tag name" -m "tag message"
```

