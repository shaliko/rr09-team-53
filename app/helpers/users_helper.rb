module UsersHelper
  #tag width gravatar image
  def gravatar_tag(user, options={})
    image_tag(user.gravatar_url(options), {:alt => user.username, :class => 'avatar', :size => ((not options.blank? and not options[:size].blank?) ? "#{options[:size].to_i}x#{options[:size].to_i}" : '40x40')})
  end

  def gravatar_link_to(user, options={})
    link_to gravatar_tag(user, options), user_path(user), :title => user.username
  end

end