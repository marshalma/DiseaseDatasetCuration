module DiseasesHelper
  def parameters_yaml_path
    return "./config/parameters.yml"
  end

  def get_questions
    data = YAML.load_file parameters_yaml_path
    num_per_page = data[:num_item_per_page.to_s]
    diseases = []

    while diseases.size < num_per_page
      # byebug
      rand_num = rand(1..Disease.count)
      disease = Disease.find_by_id(rand_num)
      next if disease.closed == true
      diseases << disease
    end

    return diseases
  end

end
