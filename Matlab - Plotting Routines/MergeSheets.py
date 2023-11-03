import pandas as pd
import re

# import required module
import os
# assign directory
directory = 'C:/Users/hesse/Desktop/F21/Thesis/SimData'


with pd.ExcelWriter('output.xlsx',engine="xlsxwriter") as writer:  
    # iterate over files in
    # that directory
    for filename in os.listdir(directory):
        f = os.path.join(directory, filename)
        # checking if it is a file
        if os.path.isfile(f):

            x = re.findall("\d+.csv", f)[0]
            phi = str(x[:-4])

            sheetname = "Phi_" + phi
            print(sheetname)
            colnames = ['Time_sec',	'X_m',	'Y_m',	'Z_m',	'Phi_rad',	'Alpha_rad']
            df1 = pd.read_csv(f, header=None)
            df1.columns = colnames
            df1.to_excel(writer, sheet_name=sheetname)

            #print(df1)