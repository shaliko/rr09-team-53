class User < ActiveRecord::Base
  is_gravtastic :email,
    :rating   => 'G',
    :default  => 'identicon',
    :size     => 40

  acts_as_authentic do |c|
    c.login_field            = :email
    c.openid_required_fields = [:nickname, :email]
  end

  validates_presence_of :username

  def deliver_password_reset_instructions!  
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

  private

  def map_openid_registration(registration)
    self.email = registration["email"] if email.blank?
    self.username = registration["nickname"] if username.blank?
  end

end
