class DoclateObserver < ActiveRecord::Observer

  def after_create(doclate)
    Feed.create(:user => doclate.user, :subject => doclate, :event_type => Feed::Types::CREATE_DOCLATE)
  end

  def after_update(doclate)
    Feed.create(:user => doclate.user, :subject => doclate, :event_type => Feed::Types::UPDATE_DOCLATE)
  end
  
  def after_destroy(doclate)
    Feed.create(:user => doclate.user, :subject => doclate, :event_type => Feed::Types::DELETE_DOCLATE)
  end

end
