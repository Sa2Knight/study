# RubyのThreadクラスに関する勉強用


th = Thread.new do
  3.times do
    puts 'hello'
    sleep 1
  end
end

puts 'before thread'
th.join
puts 'after thread'
