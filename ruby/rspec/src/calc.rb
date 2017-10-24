class Calc

  #
  # 2数の和を戻す
  # 但し10を超えた場合nilを戻す
  #
  def add(a, b)
    a + b <= 10 ? a + b : nil
  end

  #
  # 2数の差を戻す
  # 但し0未満の場合nilを戻す
  #
  def subtract(a, b)
    0 <= a - b ? a - b : nil
  end

end
