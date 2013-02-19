module ApplicationHelper

  def icon_activable_link_to(element_type, icon_name, text, path, options = {})
    content_tag element_type, class: "#{'active' if request.path == path}" do 
      link_to path, options do
        "<i class='icon-#{icon_name}'></i> #{text}".html_safe
      end
    end
  end

  def time_ago_with_tense(time)
    if Time.now > time then time_ago_in_words(time) + " ago"
    else                    time_ago_in_words(time) + " from now" end
  end
  
end
