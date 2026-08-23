The [`Readonly<T>`](https://www.typescriptlang.org/docs/handbook/utility-types.html#readonlytype) utility creates a new type where all the top-level properties are [`readonly`](https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes-func.html#readonly-and-const), preventing them from being reassigned after initialization.

```typescript
interface UserProfile {
  id: string;
  name: string;
  preferences: {
    readonly theme: "light" | "dark";
    notifications: boolean;
  };
}

type ConstantUserProfile = Readonly<UserProfile>;

// this is the same as
// type ConstantUserProfile = {
//   readonly id: string;
//   readonly name: string;
//   readonly preferences: {
//     readonly theme: "light" | "dark";
//     notifications: boolean;
//   };
// }
```