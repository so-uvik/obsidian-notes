[Object literal types](https://www.typescriptlang.org/docs/handbook/2/objects.html) allow you to describe the shape of an object:

```typescript
function logSaiyan(saiyan: { name: string; power: number }) {
  console.log(`${saiyan.name} has power level: ${saiyan.power}!`);
  // ...
}
```

Or, more likely, you'll define the object type first:

```typescript
type Saiyan = {
  name: string;
  power: number;
};

function logSaiyan(saiyan: Saiyan) {
  console.log(`${saiyan.name} has power level: ${saiyan.power}!`);
  // ...
}
```

It's **so** nice to get a little red squiggly line in your editor when you misspell a property name in TypeScript! JavaScript won't fail until you run it...