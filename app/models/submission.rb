class Submission < ActiveRecord::Base
  belongs_to :disease
  belongs_to :user
end
