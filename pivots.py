import pandas
import numpy

dates_range = pandas.date_range('2010/10/1',periods = 3).repeat(4)
print(dates_range)