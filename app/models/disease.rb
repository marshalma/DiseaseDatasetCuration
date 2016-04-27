class Disease < ActiveRecord::Base
  has_many :submissions
  has_many :users, :through => :submissions

  require "csv"
  # require "csv"

  # def self.import(file)
  #   csv = CSV.read(file.path, { :col_sep => "\t"})
  #   csv.each do |row|
  #     arr = ["disease",row[0],"accession",row[1]]
  #     Disease.create!(Hash[*arr])
  #   end
  # end

end
