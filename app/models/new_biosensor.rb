class NewBiosensor < ActiveRecord::Base
#a helper to make things into Excel
#  acts_as_xlsx
#railscasts.com/episodes/362-exporting-csv-and-excel?view=asciicast
#Adds a to_csv method that allows us to export data as such. 
def self.to_csv
  CSV.generate do |csv|
    csv << column_names
    all.each do |biosensor| 
      csv << biosensor.attributes.values_at(*column_names) 
    end 
  end 
 end 
end
