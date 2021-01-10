type Options = {
  a: string;
  b?: number;
  c?: boolean;
};

type RequiredOptions = Required<Options>;
