So what happens if we create an absolute _monstrosity_ of a union type? It can happen faster than you'd expect... Say we're building a `MoveMessage` type describing a message about a character's movement in a game:

```typescript
type Distance = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9;
type Class =
  | "Warrior"
  | "Rogue"
  | "Mage"
  | "Cleric"
  | "Paladin"
  | "Druid"
  | "Hunter"
  | "Shaman";
type MoveMessage =
  `The ${Class} moves ${Distance}, ${Distance}, ${Distance}, ${Distance}, then ${Distance} spaces.`;

const message: MoveMessage = "The Warrior moves 6, 2, 5, 4, then 7 spaces.";
```

There's a good chance you'll run into an error like this:

> **Error: Union type too complex to represent.**

This happens because we've tried to create an explicit union of types that has **exploded** in size. There are hundreds of thousands of possible combinations in the type above. Even if we remove a couple of the `Distance` values:

```typescript
type MoveMessage =
  `The ${Class} moves ${Distance}, ${Distance}, then ${Distance} spaces.`;
```

When I hover the `MoveMessage` type in my editor, I see:

there are still over `5,000` combinations! TypeScript doesn't like that - it can slow down your editor and compilation times to a crawl. So, at a certain point, `tsc` says "enough is enough".

This is a good example of a phrase you might hear in the TypeScript community: "Type Masturbation". I know it's a bit crass, but I didn't invent the term. It just means that you can go too far with trying to create hyper specific types.

_Maybe a `string` would have sufficed after all_.