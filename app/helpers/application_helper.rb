module ApplicationHelper

  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) + 
      " ".html_safe + 
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path(:authenticity_token => form_authenticity_token()), method: 'delete', class: style      
    end
  end

  def source_helper(layout_name)
    if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout", 
      class: "source-greeting")
    end
  end

  def copyright_generator
    '© 2018 Ged Sargent | All rights reserved'
  end

  def nav_helper style, tag_type = 'span'
nav_links = <<NAV
<#{tag_type}><a href="#{root_path}" class="#{style}">Home</a></#{tag_type}>
<#{tag_type}><a href="#{about_me_path}" class="#{style}">About Me</a></#{tag_type}>
<#{tag_type}><a href="#{contact_path}" class="#{style}">Contact</a></#{tag_type}>
<#{tag_type}><a href="#{blogs_path}" class="#{style}">Blog</a></#{tag_type}>
<#{tag_type}><a href="#{portfolios_path}" class="#{style}">Portfolio</a></#{tag_type}>

NAV
    nav_links.html_safe
  end
end
