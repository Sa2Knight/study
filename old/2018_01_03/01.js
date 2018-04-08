const lazyMultiply = (funX, funY) => {
  const x = funX()
  if (x === 0) {
    return 0
  } else {
    console.log("評価!")
    return x * funY()
  }
}

const a = lazyMultiply(
  () => 0,
  () => 100
)
