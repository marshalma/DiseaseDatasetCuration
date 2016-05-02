class Disease < ActiveRecord::Base
  require 'yaml'

  has_many :submissions
  has_many :users, :through => :submissions


  require 'csv'

  def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |disease|
          csv << disease.attributes.values_at(*column_names)
        end
      end
  end
  

  def self.parameters_yaml_path
    return "./config/parameters.yml"
  end

  def self.get_questions
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
