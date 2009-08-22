class Friendship < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :friend, :class_name => "User"

  after_create :log_in_feed

  private
  def log_in_feed
    Feed.create(:user => self.user, :subject => self.friend, :event_type => Feed::Types::FOLLOW)
  end
end
