This is one of the more unhinged features of TypeScript (at least in my opinion), but it is really cool and insanely powerful when you find a good use case for it.

Remember literal types and type unions?

```ts
type Class = "wizard" | "warrior" | "rogue";
```

Well, you can also create literal types using string templates:

```ts
type Hero = `elf ${Class}`;
```

The type of `Class` expands _automatically_ to the possible values, so the above is the same as:

```ts
type Hero = "elf wizard" | "elf warrior" | "elf rogue";
```

You can also get crazy and combine all the combinations of two types:

```ts
type Class = "wizard" | "warrior" | "rogue";
type Race = "elf" | "human" | "dwarf";
type Hero = `Hero: ${Race} ${Class}`;
// Hero: elf wizard | Hero: elf warrior | Hero: elf rogue | Hero: human wizard | Hero: human warrior | Hero: human rogue | Hero: dwarf wizard | Hero: dwarf warrior | Hero: dwarf rogue
```

You can also create types that enforce a simple pattern match. For example:

```ts
type LogRecord = `${string}: ${number}`;

// this is valid because it's a string followed by a colon and a number
const criticalErr: LogRecord = "CRITICAL: 69";

// these are all invalid
const criticalErr: LogRecord = "CRITICAL 92";
const criticalErr: LogRecord = "CRITICAL: 92a";
const criticalErr: LogRecord = "92: CRITICAL";
```