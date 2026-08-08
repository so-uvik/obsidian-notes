The most common way to declare an [array](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#arrays) is using the bracket notation, `string[]`, `number[]`, etc.:

```typescript
function trainJedi(jediKnights: string[]) {
  for (let knight of jediKnights) {
    console.log(`Training ${knight}...`);
  }
}

trainJedi(["Dooku", "Qui-Gon", "Xanatos"]);
// Training Dooku...
// Training Qui-Gon...
// Training Xanatos...
```