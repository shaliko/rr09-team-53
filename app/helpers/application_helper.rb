# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Flash messages block
  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << content_tag(:div, html_escape(flash[msg.to_sym]), :id => "flash-#{msg}", :class => "flash #{msg}") unless flash[msg.to_sym].blank?
    end
    messages
  end

	# Set page title
	def title(page_title)
		content_for(:title) { page_title }
	end

end
