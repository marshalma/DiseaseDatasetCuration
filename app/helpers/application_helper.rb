module ApplicationHelper
  def full_title(title = "")
    base_title = "Disease Dataset Curation"
    if title.length == 0
      base_title
    else
      "#{base_title} | #{title}"
    end
  end
end
