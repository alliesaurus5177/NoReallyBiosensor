# Be sure to restart your server when you modify this file.

#Adds .xls functionality to application. 
#Used to allow exporting of biosensors database as Excel file 
#Following tutorial at railscasts.com/episodes/362-exporting-csv-and-excel
Mime::Type.register "application/xls", :xls
#Adds xlsx 
Mime::Type.register "application/xlsx", :xlsx
# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
