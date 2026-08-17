There's a special variant of enums, [`const enums`](https://www.typescriptlang.org/docs/handbook/enums.html#const-enums), which are completely removed during compilation and replaced with their literal values. Unlike regular enums, they don't ship extra mapping code.

```typescript
const enum Direction {
  North = "NORTH",
  East = "EAST",
  South = "SOUTH",
  West = "WEST",
}

const whereWinterComesFrom = Direction.North;
```

Const enums are more performant, but do come with some limitations:

1. **No computed values**: They can reference other enum members, but can't use arbitrary expressions.

```typescript
const enum FavoriteActor {
  BradPitt = "Brad Pitt",
  AngelinaJolie = "Angelina Jolie",
  // this is okay, it references enum members
  BestCouple = FavoriteActor.BradPitt + " and " + FavoriteActor.AngelinaJolie,
}

const enum FavoriteActor {
  BradPitt = "Brad Pitt",
  AngelinaJolie = "Angelina Jolie",
  // this is not okay
  // const enum member initializers must be constant expressions
  BestCouple = getBestCouple(),
}
```

2. **Mapping issues**: Const enums don't have runtime representation, so getting the name from the number isn't possible.

```typescript
const enum Direction {
  North, // 0
  East, // 1
  South, // 2
  West, // 3
}

const directionValue = Direction.West;

// This errors:
// A const enum member can only be accessed using a string literal.(2476)
const directionName = Direction[directionValue];

// and if you do use a string literal, it just returns the value again
const directionValueAgain = Direction["West"];
// 3
```

I'd only use `const enums` when I'm really concerned about performance and bundle size.