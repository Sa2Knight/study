class Singleton
  private_class_method(:new, :dup, :clone)
  def self.instance
    @@instance ||= new
  end
end

class Hoge < Singleton
end

class Fuga < Singleton
end

p Hoge.instance
p Fuga.instance
