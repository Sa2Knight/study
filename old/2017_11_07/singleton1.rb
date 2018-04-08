class Singleton

  private_class_method(:new, :dup, :clone)

  def self.instance
    @@single ||= new
  end

  def initialize
    @name = 'sasaki'
  end

  def say
    p 'Hello,' + @name
  end

  def set
    @name = 'saito'
  end

end

a = Singleton.instance
b = Singleton.instance

p a.object_id
p b.object_id

a.say
b.say

a.set
b.say
