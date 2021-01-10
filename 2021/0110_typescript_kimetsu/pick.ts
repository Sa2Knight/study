type Type1 = {
  a: number;
  b: string;
  c: number[];
  d: string[];
};

type Type2 = Pick<Type1, "a" | "b">;
