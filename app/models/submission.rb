class Submission < ActiveRecord::Base
  belongs_to :disease
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :disease_id, presence: true
  validates :reason, presence: true
  validates_inclusion_of :is_related, in: [true, false]

  def self.insert(arr)
  	while (arr.size >= 4) do
  		$dis_id = arr.shift
  		$user_id = arr.shift
  		$choose = arr.shift
  		$reason = arr.shift
      byebug
  		arr_insert = ["disease_id", $dis_id, "user_id", $user_id, "is_related", $choose, "reason", $reason]
  		Submission.create!(Hash[*arr_insert])
  	end
  end
end
