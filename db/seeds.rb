require 'csv'

# Diseases
csv = CSV.read(Rails.root.join('lib', 'seeds', 'whole_rare_disease_list_result.csv'), { :col_sep => "\t"})
csv.each do |row|
    arr = ["disease",row[0],"accession",row[1]]
    Disease.create!(Hash[*arr])
end
puts csv.to_s

# Users
User.create!(name: "666", email: "666@gmail.com", password: "foobar", password_confirmation: "foobar", admin: true)
User.create!(name: "mashuo", email: "mashuo93@gmail.com", password: "19930521", password_confirmation: "19930521", admin: true)


_user = User.first
_disease = Disease.first
(1..11).each {Submission.insert!(disease_id: _disease.id, user_id: _user.id, is_related: true, reason: 1)}
# (1..10).each {Submission.insert!(disease_id: _disease.id, user_id: _user.id, is_related: false, reason: 1)}
