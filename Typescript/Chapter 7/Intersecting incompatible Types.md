What happens when we intersect types with overlapping properties?

```ts
type Saiyan = {
  name: string;
  powerLevel: number;
};

type Human = {
  name: string;
  age: number;
};

type SaiyanHuman = Saiyan & Human;
```

We get this `SaiyanHuman` type that's the equivalent of:

```ts
type SaiyanHuman = {
  name: string;
  powerLevel: number;
  age: number;
};
```

It merges the properties of both `Saiyan` and `Human`, and because `name` overlaps, it safely combines the two types and appears once in the resulting type.

## When Things Go Wrong

What happens if the `name` field were incompatible types? For example:

```ts
type Saiyan = {
  name: "goku" | "vegeta";
  powerLevel: number;
};

type Human = {
  name: "krillin" | "yamcha";
  age: number;
};

type SaiyanHuman = Saiyan & Human;
```

Now the `name` property can't possibly satisfy both! Humans must be `krillin` or `yamcha`, and Saiyans must be `goku` or `vegeta`. So, the `name` property in `SaiyanHuman` becomes `never`, which in turn makes the _entire_ `SaiyanHuman` type `never`.

```ts
// Type '{}' is not assignable to type 'never'
const theLaneagen: SaiyanHuman = {};
```

It's TypeScript saying, "Hey, the SaiyanHuman type is impossible, do something else." Most of the time, the solution here is to redesign your types to avoid incompatible intersections and _make sense_.