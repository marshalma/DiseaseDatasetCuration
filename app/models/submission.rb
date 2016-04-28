class Submission < ActiveRecord::Base
  belongs_to :disease
  belongs_to :user

  

  def self.insert(arr)
  	while (arr.size >= 4) do
  		$dis_id = arr.shift
  		$user_id = arr.shift
  		$choose = arr.shift
  		$reason = arr.shift
  		arr_insert = ["disease", $dis_id, "accession", $user_id, $choose, $reason]
  		Submission.create!(Hash[*arr_insert])
  	end
  	
  end
end
