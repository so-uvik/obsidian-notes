Numeric enums can be nice when:

- You actually want numbers
- You really want to eke out every last bit of performance (numbers use less memory than strings)

But often, string enums are easier to work with if you _just_ want labels.

```typescript
enum LogLevel {
  ERROR = "ERROR",
  WARN = "WARN",
  INFO = "INFO",
  DEBUG = "DEBUG",
}

function structuredLog(message: string, level: LogLevel) {
  console.log(`[${level}] ${message}`);
}

structuredLog("User not found", LogLevel.ERROR);
// Outputs: [ERROR] User not found
```

When enums only exist within your code, numeric enums are totally fine. They start to get _really_ hairy when you need to serialize them to JSON or store them in a database. There's nothing worse than debugging API responses and seeing this:

```json
{
  "id": "94e83b65-ae9c-47f4-b788-d3f4fd085067",
  "name": "Lane",
  "user_type": 7 // what the h*ck is 7?!?!?
}
```

>[!Tip]
>With a numeric enum, TypeScript compiles it to an object with a two-way mapping — both `name → value` and `value → name`:
>```ts
>enum Numeric { Low, Medium } 
>// compiles to roughly:
>// { 0: "Low", 1: "Medium", Low: 0, Medium: 1 }
>```
>
>That reverse mapping is what lets you do `Numeric[0]` and get `"Low"` back.
>
>String enums **only get the one-way mapping** (`name → value`) — there's no reverse entries generated, because the compiler doesn't know your numbers are meant to correspond to enum positions. So `RequestSeverity[severity]` where `severity` is a plain `number` has nothing to index into — TypeScript correctly flags it as invalid.

