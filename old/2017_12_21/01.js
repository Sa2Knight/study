// 値を1加算して戻す
const succ = (n) => n + 1

// 偶数であるかを戻す
const even = (n) => n % 2 === 0

// 指定したアルゴリズムによる無限リスト
const iterate = (init) => {
  return (step) => {
    return [init, () => {
      return iterate(step(init))(step)
    }]
  }
}

// 無限リストに対して条件でフィルタリングする
const filter = (predicate) => {
  return (aStream) => {
    const head = aStream[0]
    if (predicate(head)) {
      return [head, () => {
        return filter(predicate)(aStream[1]())
      }]
    } else {
      return filter(predicate)(aStream[1]())
    }
  }
}

// 0,1,2,3...の無限リスト
const enumStream = iterate(0)(succ)

// 無限リストに対して任意の要素を取得する
const elemAt = (n) => {
  return (aStream) => {
    if (n === 1) {
      return aStream[0]
    } else {
      return elemAt(n - 1)(aStream[1]())
    }
  }
}

// 0,2,4,6...の無限リスト
const evenStream = filter(even)(enumStream)

// 無限リストを先頭から任意の数の配列にする
const streamToArray = (len) => {
  return (aStream) => {
    if (len === 1) {
      return [aStream[0]]
    } else {
      return [aStream[0]].concat(streamToArray(len - 1)(aStream[1]()))
    }
  }
}

// [ 0, 2, 4, 6, 8, 10, 12, 14, 16, 18 ]
console.log(streamToArray(10)(evenStream))
