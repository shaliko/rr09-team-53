module UsersHelper
  #tag width gravatar image
  def gravatar_tag(user, options={})
    image_tag(user.gravatar_url(options), {:alt => user.username, :class => 'avatar'})
  end
end
