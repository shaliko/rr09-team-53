class User < ActiveRecord::Base
  has_many  :doclates, :dependent => :destroy
  has_many  :documents, :dependent => :destroy

  is_gravtastic :email,
    :rating   => 'G',
    :default  => 'identicon',
    :size     => 40

  acts_as_authentic do |c|
    c.login_field            = :email
    c.openid_required_fields = [:nickname, :email]
  end

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  validates_presence_of :username

  def feeds
    Feed.all(:conditions => ["user_id IN (?)", self.friends], :include => [:user], :order => "created_at DESC", :limit => "10")
  end

  def deliver_password_reset_instructions!  
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

  private

  def map_openid_registration(registration)
    self.email    = registration["email"]     if email.blank?
    self.username = registration["nickname"]  if username.blank?
  end

end
