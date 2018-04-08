// 10倍を足す関数
const multiple = (n) => n * 10

// n, n+1, n+2...の無限ストリーム
const enumStream = (n) => {
  return [n, () => enumStream(n + 1)]
}

// 無限リストに対して特定の変換処理をかける無限ストリーム
const map = (transform) => {
  return (aStream) => {
    const head = aStream[0]
    return [transform(head), () => {
      return map(transform)(aStream[1]())
    }]
  }
}

// 0, 10, 20, 30...の無限ストリーム
let stream1 = map(multiple)(enumStream(0))

// 無限リストの先頭からN個取り出す
const take = (n) => {
  return (aStream) => {
    if (n === 0) {
      return null
    } else {
      return [aStream[0], () => {
        return take(n - 1)(aStream[1]())
      }]
    }
  }
}

// 0, 10, 20, 30 の有限ストリーム
let stream2 = take(4)(stream1)

// 有限ストリームすべての要素がtrueであるかを判定するall関数
const all = (aStream) => {
  const allHelper = (aStream, accumulator) => {
    const head = aStream[0]
    const newAccumulator = accumulator && head
    if (aStream[1]() === null) {
      return newAccumulator
    } else {
      return allHelper(aStream[1](), newAccumulator)
    }
  }
  return allHelper(aStream, true)
}

