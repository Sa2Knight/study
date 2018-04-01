a = b = 1
count = 0

while (count < 30) do
  c = a + b

  sum = c.to_s.split(//).reduce(0) {|ac, n| ac + n.to_i}
  if (c % sum == 0)
    puts c
    count += 1
  end
  a, b = b, c
end
