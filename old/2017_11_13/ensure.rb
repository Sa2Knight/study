def func
  0 / 0
rescue ZeroDivisionError => e
  p e
ensure
  p "end"
end

func
