JavaScript added support for private class members in ES2022 with the `#` syntax. TypeScript respects that syntax, and will give you compilation errors if you try to access private members outside of the class.

```typescript
class SecretAgent {
  // a private field
  #id: string;

  constructor(id: string) {
    this.#id = id;
  }

  // a public method
  getCodeName(): string {
    const idToCodeNameMap: { [key: string]: string } = {
      "007": "James Bond",
      "006": "Alec Trevelyan",
      // Add more mappings as needed
    };
    return idToCodeNameMap[this.#id] || "Unknown Agent";
  }
}

const bond = new SecretAgent("007");
console.log(bond.getCodeName()); // "James Bond"

// Property '#id' is not accessible outside class 'SecretAgent' because it has a private identifier.
console.log(bond.#id);
```

In plain JavaScript, we'd only get the error at _runtime_, but with the same syntax in TypeScript, we get the error at _compile time_. Much better!