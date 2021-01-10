type UserName = "Tanjiro" | "Zenitsu" | "Inosuke" | undefined;
type NonNullableUserName1 = NonNullable<UserName>;

type NonNullableUserName2 =
  | NonNullable<"Tanjiro">
  | NonNullable<"Zenitsu">
  | NonNullable<"Inosuke">
  | NonNullable<undefined>;

type Type3 = NonNullable<undefined>;
