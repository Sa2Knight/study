# Pandasの基本はDataFrameでデータを取り扱う
# データフレームは二次元のデータを表現できる
import pandas as pd

a = pd.DataFrame([
  [10, 20, 30],
  [40, 50, 60],
  [70, 80, 90]
])

print(a)
