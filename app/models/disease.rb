class Disease < ActiveRecord::Base
  has_many :submissions
  has_many :users, :through => :submissions

  require 'csv'

  def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |disease|
          csv << disease.attributes.values_at(*column_names)
        end
      end
  end
  
end
