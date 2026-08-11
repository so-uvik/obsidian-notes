To be fair, position-based access isn't very descriptive. Luckily, you can **label tuple elements** (sometimes called "named tuples"). So, instead of this:

```typescript
type UserData = [string, number, boolean];
```

We can do this:

```ts
type UserDataLabeled = [name: string, age: number, isAdmin: boolean];
```

Labels make your code more "self-documenting".

You might hear people say "there's no such thing as self-documenting code". Those people are just mad because they write terrible code. If you name things well and keep things simple, you'll still need comments _occasionally_, but you won't need them as _often_.

When you hover over a variable in your editor, you'll see names instead of just positions:

```typescript
// Your editor shows the full type:
// [name: string, age: number, isAdmin: boolean]
function getUser(): UserDataLabeled {
  return ["Frodo", 33, false];
}
```

## Labels Are Just Documentation

The labels are quite literally just names for the TypeScript tooling, they don't change how the values are accessed. Say I have a named tuple like this:

```typescript
const user: [name: string, age: number] = ["Bilbo", 111];
```

And then I try to destructure in reverse order:

```typescript
const [age, name] = user;
console.log(age); // "Bilbo"
console.log(name); // 111
```

The variable names I choose when destructuring _don't matter_: **only the positions do**.