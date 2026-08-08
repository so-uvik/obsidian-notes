If you can do it in JavaScript, you can model it in TypeScript. It might not always be _pretty_... but in this case it is!

In languages like Go, you can't have an array that contains different types - at least not without using something a bit more complex like a struct or an interface. But in TypeScript, we can just [union](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#union-types) the types!

```typescript
// TypeScript infers the type as (string | number)[]
let lightsaberStyles = [1, 2, "double", "shoto"];

function describe(style: string | number): void {
  console.log(`Wield ${style} lightsaber`);
}

lightsaberStyles.forEach(describe);
// Wield 1 lightsaber
// Wield 2 lightsaber
// Wield double lightsaber
// Wield shoto lightsaber
```