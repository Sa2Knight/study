type Options = {
  capture?: boolean;
  once?: boolean;
  passive?: boolean;
};

declare function hogeaddEventListener(
  name: string,
  callback: Function,
  options?: Options | boolean
);

// 使用例
hogeaddEventListener("foobar", () => {});
hogeaddEventListener("event", () => {}, true);
hogeaddEventListener("event2", () => {}, {});
hogeaddEventListener("event3", () => {}, {
  capture: true,
  once: false,
});

// エラー例
hogeaddEventListener("foobar", () => {}, "string");
hogeaddEventListener("hoge", () => {}, {
  capture: true,
  once: false,
  excess: true,
});
