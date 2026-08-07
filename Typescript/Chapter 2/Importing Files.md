With certain TypeScript configurations you _can_ import types directly from a module:

```ts
import { User, Post } from "./models";
```

But it's much safer and _more efficient_ to use the `import type` syntax:

```ts
import type { User, Post } from "./models";
```

This way TypeScript _knows_ that you're only importing types, and it can drop the imports so they don't generate extra JavaScript code when your project is compiled. This means a smaller final **bundle size**. This syntax also works:

```ts
import { type User, type Post } from "./models";
```

But personally I prefer the first one. It's more concise and keeps all my type imports in one place.