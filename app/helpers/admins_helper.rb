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


  def admin?
    user = User.find_by_id(session[:user_id])
    if !user || !user.admin?
      flash[:warning] = "Permission denied!"
      redirect_to root_path
      return
    end
  end


  def find_conditional_diseases
    query = session[:search]
    sort = session[:sort]

    if !query.nil? && !sort.nil?
      sort_criteria = (sort[0] == "submission" ? 'related + unrelated DESC' : {sort[0] => (sort[1]? :desc : :asc)})
      if (query =~ /^E-.*$/) != nil
        @diseases = Disease.where(:accession => query).order(sort_criteria)
      else (query =~ /^\w+/) != nil
        @diseases = Disease.where(:disease => query).order(sort_criteria)
      end
    elsif !query.nil?
      if (query =~ /^E-.*$/) != nil
        @diseases = Disease.where(:accession => query)
      else (query =~ /^\w+/) != nil
        @diseases = Disease.where(:disease => query)
      end
    elsif !sort.nil?
      @disease = sort[0] == "submission" ? Disease.order('related + unrelated DESC') : Disease.order(sort[0] => (sort[1]? :desc : :asc))
    else
      @diseases = Disease.all
    end

  end

end
