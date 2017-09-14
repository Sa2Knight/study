import pandas as pd

data = pd.DataFrame({
  'name': ['sasaki', 'saito', 'nakamura', 'hidaka'],
  'age':  [25, 24, 26, 24]
})

print("年齢でソート")
print(data.sort_values(by="age"))

print("年齢降順でソート")
print(data.sort_values(by="age", ascending=False))

print("行と列を反転")
print(data.T)
