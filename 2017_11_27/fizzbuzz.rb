numbers = 1.step
fizzes = [nil, nil, "Fizz"].cycle
buzzes = [nil, nil, nil, nil, "Buzz"].cycle

require 'pp'
pp numbers
  .lazy
  .zip(fizzes, buzzes)
  .map {|n, *yells| yells.any? ? yells.join : n}
  .take(30)
  .each(&method(:puts))
