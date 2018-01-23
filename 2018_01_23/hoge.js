const promise1 = new Promise((resolve) => {
  setTimeout(() => {
    console.log("promise1")
    resolve(1000)
  }, 1000)
})
const promise2 = new Promise((resolve) => {
  setTimeout(() => {
    console.log("promise2")
    resolve(500)
  }, 500)
})
const promise3 = new Promise((resolve, reject) => {
  setTimeout(() => {
    console.log("promise3")
    reject('hoge')
  }, 2000)
})

Promise.race([promise1, promise2, promise3])
  .then((v) => console.log(v))
  .catch((e) => console.log(e))
