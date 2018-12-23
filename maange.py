import os
import datetime
# def set_time(request):
print(datetime.datetime.now())
os.environ["FAKETIME"] = "2020-01-01 00:00:00"  
# Note: time of type string must be in the format "YYYY-MM-DD hh:mm:ss" or "+15d"
print(datetime.datetime.now())