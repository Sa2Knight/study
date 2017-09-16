M, N = gets.chomp.split(' ').map {|n| n.to_i}

# 足し算を順に出力
a = 99
b = 0
M.times do |t|
  puts "#{a} + #{b} ="
  b -= 1
  if b < 0
    a -= 1
    b = 99 - a
  end
end

# 引き算を順に出力
a = 99
b = 99
N.times do |t|
  puts "#{a} - #{b} ="
  b -= 1
  if b < 0
    a -= 1
    b = a
  end
end
