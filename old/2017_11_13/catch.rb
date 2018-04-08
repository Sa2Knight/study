def hoge
  result = catch(:label) do
    Array(1..10).each do |a|
      Array(20..30).each do |b|
        throw(:label, [a, b]) if (a + b) % 2 === 0
      end
    end
  end
  result
end

p hoge
