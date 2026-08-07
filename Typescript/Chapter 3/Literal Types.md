Many other statically typed languages (including Go) don't have nearly as extensive and powerful type systems as TypeScript. It should be obvious because it's in the name, but TypeScript truly has a massive type system.

[Literal types](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#literal-types) are incredibly powerful for narrowing the possible values of a variable.

- A string can have an infinite number of values.
- A number can have an infinite number of values.

So what if we want to declare a "direction" variable?

```typescript
function move(direction: string) {
  // Implementation...
}
```

This kinda sucks... direction can be any string! To be fair, in many languages enums are used to solve this problem. And while TypeScript does have enums, which we'll cover later, literal types are a more lightweight solution. A literal value can be used as a type:

```ts
function move(direction: "north") {
  // Implementation...
}
```

Now `direction` can _only_ be "north"!