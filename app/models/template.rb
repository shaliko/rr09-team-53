class Template < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :parent, :class_name => 'Template', :foreign_key => 'id'

  attr_accessible :title, :body_markdown, :private

  validates_presence_of     :title, :body_markdown
  validates_length_of       :title, :maximum => 255

  def self.per_page
    25
  end

end
