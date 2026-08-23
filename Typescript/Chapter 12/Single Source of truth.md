It's incredibly common for a TypeScript codebase to amass a truly absurd number of custom type definitions - hundreds of interfaces and types, all with slightly different numbers of fields for a lot of the same "entities". You might run into crazy stuff like:

```typescript
interface User {
  id: string;
  name: string;
  email: string;
  age: number;
}

interface UserWithoutId {
  name: string;
  email: string;
  age: number;
}
```

_This is bad_. We generally try to avoid redefining the same types over and over, and instead try to follow a ["single source of truth"](https://en.wikipedia.org/wiki/Single_source_of_truth) approach. For example, here we could refactor a bit:

```typescript
interface UserWithoutId {
  name: string;
  email: string;
  age: number;
}

interface User extends UserWithoutId {
  id: string;
}
```

There are other techniques to do this even more cleanly that we'll cover later in this chapter.

In other words, we try to **define our types once**, and build type systems that rely on inference and type transformations to _derive_ the types we need automatically. That way, when we make changes, we only have to do it in one place. In our second example, updating `UserWithoutId` will now automatically update `User` as well: a big win.