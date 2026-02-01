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

# Conventional Tags

Tags are used for all sorts of reasons, but sometimes they're used to denote releases. In that case, tags that follow [semver](https://semver.org/) are common.

To [tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging):

```sh
git tag -a v3.10.2 -m "Fixed a lil bug"
```

Pretty much anywhere you can use a commit hash, you can use a tag name when working with the `git` CLI. It's a ["commitish"](https://git-scm.com/docs/gitglossary.html#Documentation/gitglossary.txt-aiddefcommit-ishacommit-ishalsocommittish).

_Optionally, you can push your tags up to your remote GitHub repo with `git push origin --tags`._

>[!Info]
>You can tag a specific commit using the following command `git tag -a <tag_name> <commit_hash> -m "Tag message here"
`



