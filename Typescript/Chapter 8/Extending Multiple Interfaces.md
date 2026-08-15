You can extend multiple interfaces at once:

```typescript
type Character = {
  name: string;
  level: number;
};

interface Magical {
  mana: number;
  castSpell(spell: string): void;
}

interface Physical {
  strength: number;
  attack(): void;
}

interface BattleMage extends Character, Magical, Physical {
  combineAttacks(): void;
}
```

`BattleMage` now has all 7 properties and methods:

- `name`
- `level`
- `mana`
- `castSpell`
- `strength`
- `attack`
- `combineAttacks`