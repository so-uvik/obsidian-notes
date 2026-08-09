TypeScript (obviously) also has a [built-in](https://en.wikipedia.org/wiki/Function_\(computer_programming\)#Built-in_function) for [maps](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map), which are collections of key-value pairs. You can specify the types of the keys and values using type parameters `<K, V>`.

```typescript
// A Map with string keys and number values
const podracerSpeeds = new Map<string, number>();

podracerSpeeds.set("Anakin Skywalker", 947);
podracerSpeeds.set("Sebulba", 941);

podracerSpeeds.set("R2-D2", true);
// Error: Argument of type 'true' is not assignable to parameter of type 'number'

podracerSpeeds.set(420, 69);
// Error: Argument of type 'number' is not assignable to parameter of type 'string'
```

A map is a "set-like" object, and as such uses the [`size`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/size) property instead of `length`.

```typescript
console.log(podracerSpeeds.size);
// 2
```

How to easily iterate over a map:

```typescript
for (const [racer, speed] of podracerSpeeds) {
  console.log(`${racer} raced at ${speed} speed`);
}
// Anakin raced at 947 speed
// Sebulba raced at 941 speed
```

Here's the most important methods of a map, [`get`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/get), [`delete`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/delete), and [`has`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/has).

```typescript
console.log(podracerSpeeds.get("Sebulba"));
// 941

console.log(podracerSpeeds.has("Sebulba"));
// true

podracerSpeeds.delete("Sebulba");
console.log(podracerSpeeds.get("Sebulba"));
// undefined
```