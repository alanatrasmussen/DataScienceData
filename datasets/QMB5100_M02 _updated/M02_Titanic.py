

import pandas as pd



FILE = "C:\\Dropbox\\N_RASMUSSEN\\xQMB5100\\LECTURE\\M02\\train.csv"


df = pd.read_csv( FILE )



# Rows and Columns
#print( "rows=",df.shape[0] )
#print( "cols=",df.shape[1] )


# Column Names and Types
#print("Column Names = ", df.columns )
#print( df.dtypes )


# Nominal Values
#print("Sex = ", df.Sex.unique() )
#print("Survived = ", df.Survived.unique() )
#print("Passenger Class = ", df.Pclass.unique() )



# Group By
#g = df.groupby("Sex")

#print("Age = ", df.Age.mean() )
#print("Age by Sex = ", g.Age.mean() )

#print("Survived = ", df.Survived.mean() )
#print("Survive by Sex = ", g.Survived.mean() )




# Flag
Flag1 = df.Pclass == 1
Flag2 = df.Pclass == 2
Flag3 = df.Pclass == 3

#print( Flag1.size )
#for i in range(5) :
#    print("Passenger Class = ", df.Pclass[i] )
#    print( "Flag1", Flag1[i] )
#    print( "Flag2", Flag2[i] )
#    print( "Flag3", Flag3[i] )

# Survived
g = df.groupby("Pclass")
#print("Survived = ", df.Survived.mean() )
print("Survived by Class = ", g.Survived.mean() )

#print(" ===== ")
print( df[Flag1].Survived.mean() )
#print( df[Flag2].Survived.mean() )
#print( df[Flag3].Survived.mean() )



d = dict()
d["1"] = df[Flag1].Survived
d["2"] = df[Flag2].Survived
d["3"] = df[Flag3].Survived

d[1] = df[Flag1].Survived


print("Keys = ",d.keys())


x = d["1"]
print("Mean 1... ", x.mean() )


'''


d[1] = d["1"]


'''













