#
# プログラマ脳を鍛える数学パズル
# Q11(P051)
#

@fib_memo = {}

def fib(n)
  return @fib_memo[n] if @fib_memo[n]
  if n <= 2
    @fib_memo[n] = 1
  else
    @fib_memo[n] = fib(n - 2) + fib(n - 1)
  end
end

def get_digits_sub(number)
  number.to_s.split('').map(&:to_i).reduce(0) {|ac, n| ac + n}
end

c = 0
n = 2

while(c < 50) do
  n += 1
  f = fib(n)
  d = get_digits_sub(f)
  next unless f % d == 0

  puts "#{f} to #{f} / #{d}"
  c += 1
end
