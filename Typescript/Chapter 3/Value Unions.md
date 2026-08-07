Take another look at our last example of a literal type:

```typescript
function move(direction: "north") {
  // Implementation...
}
```

To make it a bit more useful, let's combine that idea with a union type:

```typescript
function move(direction: "north" | "south" | "east" | "west") {
  // Implementation...
}
```

And then let's refactor it to make a new "Direction" type that we can reuse:

```typescript
type Direction = "north" | "south" | "east" | "west";

function move(direction: Direction) {
  // Implementation...
}
```