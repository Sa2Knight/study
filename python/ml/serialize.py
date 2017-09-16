import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn import preprocessing
from sklearn.externals import joblib

# CSVファイルを読み込む
df = pd.read_csv('cars.csv')

# 学習に不要な行、列を削除
del df['normalized-losses']
for col in ['num-of-doors', 'price', 'bore', 'stroke', 'horsepower', 'peak-rpm']:
 df = df[df[col] != '?']

# 説明変数列と目的変数列に分割
label = df['price']
data  = df.drop('price', axis=1)

# 文字列データを数値化
le = preprocessing.LabelEncoder()
for col in ['make', 'fuel-type', 'aspiration', 'num-of-doors', 'body-style', 'drive-wheels', 'engine-location', 'engine-type', 'num-of-cylinders', 'fuel-system']:
  data[col] = le.fit_transform(data[col])

# 学習する
clf = RandomForestClassifier()
clf.fit(data, label)

# 学習結果をシリアライズ
joblib.dump(clf, 'cars.pkl')
