# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Flash messages block
  def flash_messages
    messages = ''
    %w(notice warning error).each do |msg|
      messages += content_tag(:div, html_escape(flash[msg.to_sym]), :class => "#{msg}") unless flash[msg.to_sym].blank?
    end
    unless messages.blank?
      messages = content_tag(:div, messages, :id=> 'flash', :class => 'flash')
      messages += '<script type="text/javascript">new Effect.Fade($("flash"), { duration:0.5, delay:2 })</script>'
    end
    messages
  end

	# Set page title
	def title(page_title)
		content_for(:title) { page_title }
    content_for(:head_title) { strip_tags(page_title) }
	end

  def pdf_image_tag(image, options = {})
    options[:src] = File.expand_path(RAILS_ROOT) + '/public/images/' + image
    tag(:img, options)
  end

end
