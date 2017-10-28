require 'rspec'
require_relative '../src/calc'

RSpec.describe Calc do
  describe "足し算メソッド" do
    it "通常ケースで和が戻る" do
      expect(Calc.new.add(5, 3)).to eq 8
    end
    it "和が10の場合は10が戻る" do
      expect(Calc.new.add(8, 2)).to eq 10
    end
    it "和が10を超えた場合はnilが戻る" do
      expect(Calc.new.add(8, 3)).to eq nil
    end
  end
  describe "引き算メソッド" do
    it "通常ケースで差が戻る" do
      expect(Calc.new.subtract(5, 3)).to eq 2
    end
    it "差が0の場合は0が戻る" do
      expect(Calc.new.subtract(3, 3)).to eq 0
    end
    it "差が0未満の場合はnilが戻る" do
      expect(Calc.new.subtract(3, 4)).to eq nil
    end
  end
end
