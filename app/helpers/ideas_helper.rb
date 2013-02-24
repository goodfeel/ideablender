module IdeasHelper
  def label_color(category)
    if category.length > 10
      ""
    elsif category.length > 8
      "label-warning"
    elsif category.length > 7
      "label-success"
    elsif category.length > 6
      "label-important"
    else
      "label-info"
  end
end
