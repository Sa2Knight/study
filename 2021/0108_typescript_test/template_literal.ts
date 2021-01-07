// type Hello = "Hello";
// type World = "World";
// type HelloWorld = `${Hello}, ${World}`;
// const helloWorld1: HelloWorld = "Hello, World";

// type Concat<T extends string, S extends string> = `${T}, ${S}`;
// const helloWorld2: Concat<"Hello", "World"> = "Hello, World";

type GetWorld<T extends string> = T extends `Hello, ${infer World}`
  ? World
  : never;
type World = GetWorld<"Hello, World">;
