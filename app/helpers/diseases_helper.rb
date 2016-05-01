module DiseasesHelper
  def parameters_yaml_path
    return "./config/parameters.yml"
  end

  def get_questions
    data = YAML.load_file parameters_yaml_path
    num_per_page = data[:num_item_per_page.to_s]
    diseases = []
    (0..num_per_page-1).each do
    	arr = Disease.find(rand(1...Disease.count))
     	diseases << arr
    end
    return diseases
  end

end
