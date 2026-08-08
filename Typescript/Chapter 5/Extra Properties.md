_Most of the time_, when you pass an object to a function in TypeScript, it's:

- Okay to have _more_ properties than those defined in the function's parameter type
- Not okay to have _missing_ properties

However, when you pass an object _literal_ directly to a function, TypeScript performs what's called "excess property checking". Which means it _also_ will not allow extra properties.

For example, say we have this type:

```typescript
type Spaceship = {
  name: string;
  speed: number;
};
```

and we make an object with one extra property:

```ts
const falcon = {
  name: "Millennium Falcon",
  speed: 75,
  weapons: 4,
};
```

We can pass this object to a function that expects a `Spaceship`:

```typescript
function pilot(ship: Spaceship) {
  console.log(`Piloting ${ship.name} at ${ship.speed} light-years per hour`);
}

// this is fine
pilot(falcon);
```

But interestingly, if we pass in the same object _literal_ (no variable assignment), TypeScript will throw an error:

```typescript
// Error: Object literal may only specify known properties, and 'weapons' does not exist in type 'Spaceship'.
pilot({ name: "Millennium Falcon", speed: 75, weapons: 4 });
```

_It's also worth noting that many of these kinds of rules are configurable in the [`tsconfig.json`](https://www.typescriptlang.org/tsconfig) file, which we'll cover later. We'll mostly refer to default behavior in this course_.