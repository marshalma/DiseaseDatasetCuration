class Submission < ActiveRecord::Base
  belongs_to :disease
  belongs_to :user

  require pry

  def self.insert(arr)
  	m = arr
  	binding.pry
  end
end
