const stream = {

  match: (data, pattern) => {
    return data(pattern)
  },

  empty: () => {
    return (pattern) => {
      return pattern.empty()
    }
  },

  cons: (head, tailThunk) => {
    return (pattern) => {
      return pattern.cons(head, tailThunk)
    }
  },

  head: (aStream) => {
    return stream.match(aStream, {
      empty: () => { return null },
      cons: (head, tailThunk) => {
        return tailThunk
      },
    })
  }
}
