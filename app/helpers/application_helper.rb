module ApplicationHelper

  def transparent_nav
    case controller_name
    when "welcome"
      "navbar-transparent navbar-color-on-scroll"
    else
      ""
    end
  end
end
