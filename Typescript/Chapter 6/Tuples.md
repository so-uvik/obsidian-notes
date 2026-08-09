A [**tuple**](https://www.typescriptlang.org/docs/handbook/2/objects.html#tuple-types) is a special kind of array where each position has a **specific, known type**.

```typescript
const nameAndAge: [string, number] = ["Rose Tyler", 24];
```

The existence of tuples in TypeScript has me using them where I _never_ would have used an array in JavaScript. The fact that the length is fixed and the type of index is known makes them _much_ more safe to use for small collections.

## Be Explicit With Tuples

You need to provide explicit typing with tuples! This is a tuple:

```ts
// [string, number]
const nameAndAge: [string, number] = ["John Jones", 104];
```

But if we remove the type, it's inferred as an array of `string | number`:

```ts
// (string | number)[]
const nameAndAge = ["Martha Jones", 24];
```

With a `(string | number)[]` you can do this:

```ts
const nameAndAge = ["Martha Jones", 24];
nameAndAge[1] = "Donna Noble";
```

But with a tuple, TypeScript will provide an error (which is probably what you want). So, always explicitly type your tuples!

```ts
const nameAndAge: [string, number] = ["Martha Jones", 24];
// Error: Type 'string' is not assignable to type 'number'.
nameAndAge[1] = "Donna Noble";
```