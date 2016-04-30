module DiseasesHelper

  def get_questions
    num_per_page = 5
    diseases = []
    (0..num_per_page-1).each do
    	arr = Disease.find(rand(1...Disease.count))
     	diseases << arr
    end
    return diseases
  end

end
