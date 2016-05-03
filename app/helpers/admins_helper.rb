module AdminsHelper
  include ApplicationHelper
  require 'yaml'

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

    if !query.nil?
      if (query =~ /^E-.*$/) != nil
        diseases = Disease.where(:accession => query)
      else (query =~ /^\w+/) != nil
        diseases = Disease.where(:disease => query)
      end
    else
      diseases = Disease.all
    end

    if !sort.nil?
      sort_criteria = (sort[0] == "submission" ? 'related + unrelated DESC' : {sort[0] => (sort[1] ? :desc : :asc)})
      diseases = diseases.order(sort_criteria)
    end

    return diseases
  end


  def find_conditional_users
    query = session[:query]
    order = session[:order]

    if !query.nil?
      users = User.where(email: query)
    else
      users = User.all
    end

    return users if order.nil?

    which_way = order[1] ? " DESC" : " ASC"
    case order[0]
    when "sub"
      users = users.joins(:submissions).group("users.id").order("count(users.id)" + which_way)
    when "closed_sub"
      users = users.joins(:submissions).joins("LEFT JOIN 'diseases' on diseases.id = submissions.disease_id").where("diseases.closed = ?", true).group("users.id").order("count(users.id)" + which_way)
    when "correct"
      users = users.joins(:submissions).joins("LEFT JOIN 'diseases' on diseases.id = submissions.disease_id").where("diseases.closed = ?", true).where('diseases.closed =?', true).where('(submissions.is_related = "t" and diseases.related > diseases.unrelated) or (submissions.is_related = "f" and diseases.unrelated > diseases.related)').group("users.id").order("count(users.id)" + which_way)
    when "accuracy"
      # users =
      # users.sort do |a,b|
      #   e1 = a.submissions.joins(:disease).where('diseases.closed =?', true).count
      #   d1 = a.submissions.joins(:disease).where('diseases.closed =?', true).where('(submissions.is_related = "t" and diseases.related > diseases.unrelated) or (submissions.is_related = "f" and diseases.unrelated > diseases.related)').count
      #   e2 = b.submissions.joins(:disease).where('diseases.closed =?', true).count
      #   d2 = b.submissions.joins(:disease).where('diseases.closed =?', true).where('(submissions.is_related = "t" and diseases.related > diseases.unrelated) or (submissions.is_related = "f" and diseases.unrelated > diseases.related)').count
      #   (d1 == 0 || d2 == 0) ? (0 <=> 0) : ((e1.to_f / d1.to_f) <=> (e2.to_f / d2.to_f))
      # end
    end

    return users
  end

end
