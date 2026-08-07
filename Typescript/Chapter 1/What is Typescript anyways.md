TypeScript is a _language_, but the official _implementation_ of TypeScript is the [TypeScript compiler](https://code.visualstudio.com/docs/typescript/typescript-compiling), `tsc`. Its job is simple: take TypeScript code, ensure it's valid, and then compile it into JavaScript code.

TypeScript is _not_ supported natively by most JavaScript engines, so it needs to be compiled into equivalent JavaScript code before it can be run. This interesting fact, that TypeScript code is only type-checked _before_ it's run, has led to an interesting philosophical question:

> Is TypeScript basically just a really good [linter](https://en.wikipedia.org/wiki/Lint_\(software\))?

And honestly... _yeah, I think so_. I get it, technically it does a _lot_ more than your standard linter, but from a practical perspective, its primary benefit is to do static analysis on your _almost-JavaScript_ code and catch bugs before they happen.

## Compiled to... JavaScript?

TypeScript is interesting in that it's "compiled", but not in the traditional (compiled to binary) sense. Instead, it's compiled to JavaScript. So it's not really compiled for _performance_ reasons, but rather for _compatibility_ reasons.

**The goal of TypeScript is to write JavaScript code that's easier to work with**.

## Compilation Errors

So, in this course, if your code fails to _compile_, you'll get an error like this:

```
tsc:
Type 'string' is not assignable to type 'number'.
```

Only if the compilation is successful, _then_ we run the code. So your code needs to pass compilation, _and_ needs to run correctly.
