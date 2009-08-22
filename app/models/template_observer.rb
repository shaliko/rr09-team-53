class TemplateObserver < ActiveRecord::Observer

  def after_create(template)
    Feed.create(:user => template.user, :subject => template, :event_type => Feed::Types::CREATE_TEMPLATE)
  end

  def after_update(template)
    Feed.create(:user => template.user, :subject => template, :event_type => Feed::Types::UPDATE_TAMPLATE)
  end
  
  def after_destroy(template)
    Feed.create(:user => template.user, :subject => template, :event_type => Feed::Types::DELETE_TEMPLATE)
  end

end
