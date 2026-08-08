TypeScript offers an alternative way to declare arrays using type parameter syntax: `Array<T>`, which, for now, just know that it's basically the same as the "normal" `T[]` syntax. You'll see both versions in the wild.

These function declarations are the _same_:

```typescript
// Using bracket notation
function assignLightsaberColors(name: string, colors: string[]): void {
  // ...
}
// Using generic type parameter syntax
function assignLightsaberColors(name: string, colors: Array<string>): void {
  // ...
}
```

You can also use _either_ syntax when declaring variables:

```typescript
const colors: string[] = [
  "blue",
  "green",
  "purple",
  "red",
  "orange",
  "white",
  "darksaber",
];
const midichlorianCounts: Array<number> = [
  1000, 5000, 12000, 20000, 27000, 40000,
];
```

Later, when we talk about [generics](https://www.typescriptlang.org/docs/handbook/2/generics.html), it will make a bit more sense why you might use `Array<T>` over `T[]` - and the answer is mostly because it will feel _consistent_ with other generic types.