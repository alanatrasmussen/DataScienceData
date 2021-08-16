import pandas as pd

FILE = "C:\\M02\\iris.csv"
FILE = "C:\\Dropbox\\N_RASMUSSEN\\xQMB5100\\LECTURE\\M02\\iris.csv"

df = pd.read_csv( FILE )

print( df.iloc[1] )
print( df.iloc[ [1] ] )
print( df.iloc[ 1:2 ] )


print( df.shape[0] )
print( df.shape[1] )




x = pd.crosstab( df.Species, columns="count" )
x = df["Species"].unique()


Flags_A = (df.Species == "Setosa") & ( df["SepalLength"] > 50 )

Flags_B = (df.Species == "Versicolor") & ( df["SepalLength"] > 60 )

Flags_C = (df.Species == "Virginica") & ( df["SepalLength"] > 70 )


a = df[Flags_A]
b = df[Flags_B]
c = df[Flags_C]

ird = dict()
ird["aaa"] = a
ird["bbb"] = b
ird["ccc"] = c



