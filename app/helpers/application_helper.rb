module ApplicationHelper

  def transparent_nav
    case controller_name
    when "welcome"
      "navbar-transparent navbar-color-on-scroll"
    else
      ""
    end
  end

  def render_text(text, length = nil)
    if length.nil?
      text
    else
      text.length > length ? text[0,length] + '...' : text
    end
  end
end
