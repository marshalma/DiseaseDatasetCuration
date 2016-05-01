module AdminsHelper
  require 'yaml'

  def parameters_yaml_path
    return "./config/parameters.yml"
  end

  def get_num_per_page
    data = YAML.load_file parameters_yaml_path
    return data[:num_item_per_page.to_s]
  end

  def set_num_per_page(new_value)
    data = YAML.load_file parameters_yaml_path
    data[:num_item_per_page.to_s] = new_value
    File.open(parameters_yaml_path, 'w') { |f| YAML.dump(data, f) }
  end

end
