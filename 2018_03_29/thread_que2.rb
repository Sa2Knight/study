q = Queue.new

th = Thread.new do
  loop do
    q << 'hello'
    sleep 1
  end
end

# キューにデータが積まれるまで待機する
5.times do
  puts "queを待ってます"
  puts q.pop
end
