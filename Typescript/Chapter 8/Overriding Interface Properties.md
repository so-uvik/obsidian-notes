You can override properties from the base interface, but the new type must be compatible with the original:

```typescript
interface Character {
  rank: string | number;
  name: string;
  level: number;
}

interface Wizard extends Character {
  // Wizards only have a number rank
  // This is allowed because
  // `number` is assignable to `string | number`
  rank: number;
  mana: number;
}
```

But you can't change to an incompatible type:

```typescript
interface Character {
  rank: string;
  name: string;
  level: number;
}

interface Wizard extends Character {
  // This breaks because `number` is
  // not assignable to `string`
  rank: number;
  mana: number;
}
```