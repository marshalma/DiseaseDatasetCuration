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
puts csv.to_s

User.create!(name: "666", email: "666@gmail.com", password: "foobar", password_confirmation: "foobar", admin: true)
User.create!(name: "mashuo", email: "mashuo93@gmail.com", password: "19930521", password_confirmation: "19930521", admin: true)

_user = User.find_by_name("mashuo")
_disease = Disease.find_by_id(10)
Submission.create(disease_id:_disease.id, user_id:_user.id, is_related:true, reason:1);
