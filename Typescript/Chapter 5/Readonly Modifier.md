The [`readonly` modifier](https://www.typescriptlang.org/docs/handbook/2/objects.html#readonly-properties) is _very_ similar to the `const` keyword in JavaScript. It's an added feature of TypeScript that lets us mark _object properties_ as read-only, meaning they can't be changed after initialization.

Normal object properties are fully mutable, but if we use `readonly`, we can make a property immutable:

```typescript
type Point = {
  readonly x: number;
  y: number;
};
```

Now we can create a new point like this:

```typescript
const point: Point = {
  x: 10,
  y: 20,
};
```

And we can update the `y` property just fine:

```typescript
point.y = 30; // OK
```

But if we try to update the `x` property, TypeScript will throw an error:

```typescript
// Error: Cannot assign to 'x' because it is a read-only property
point.x = 15;
```

`readonly` is pretty awesome. Just keep in mind that you probably want `readonly` properties _less often_ than you want `const` variables, because re-creating entire objects and copying all the fields can become painful and verbose if you do it too often.