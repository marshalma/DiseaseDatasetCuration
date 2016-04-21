# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv = CSV.read(Rails.root.join('lib', 'seeds', 'whole_rare_disease_list_result.csv'), { :col_sep => "\t"})
csv.each do |row|
    arr = ["disease",row[0],"accession",row[1]]
    Disease.create!(Hash[*arr])
end
puts csv


_user = User.find_by_id(1)
_disease = Disease.find_by_id(10)
byebug
Submission.create(disease_id:_disease.id, user_id:_user.id, is_related:true);
