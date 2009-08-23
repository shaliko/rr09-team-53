class Doclate < ActiveRecord::Base
  belongs_to  :user, :counter_cache => true
  belongs_to  :parent, :class_name => 'Template', :foreign_key => 'id'
  has_many    :documents, :dependent => :destroy

  attr_accessible :title, :body_markdown, :private

  validates_presence_of     :title, :body_markdown
  validates_length_of       :title, :maximum => 255

  before_save :generate_body_html

  named_scope :public, :conditions => {:private => false}
  named_scope :last_updated, :order => "updated_at DESC", :limit => 5

  def self.per_page
    3
  end

  private
  def generate_body_html
    self.body_html = replace_doclate_fields(Maruku.new(self.body_markdown).to_html)
  end

  def replace_doclate_fields(str)
    index = 0
    str.gsub(/[{]{2}([^{]+)[}]{2}/) { |s| index += 1; doclate_field_to_html(index, $1) }
  end

  def doclate_field_to_html(id, str)
    params = str.split('|').collect(&:strip)

    field_id      = id
    field_type    = params.pop
    field_title   = params[0][/\A(&#8216;|&#8217;){1}(.+)(&#8216;|&#8217;){1}\z/, 2]
    field_options = (params[1].blank?) ? '...' : params[1][/\A(&#8216;|&#8217;){1}(.+)(&#8216;|&#8217;){1}\z/, 2]

    "<span id=\"dochub-textfield-#{field_id}\" class=\"dochub-placeholder #{field_type}\" title=\"#{field_title}\">#{field_options}</span>"
  end

  named_scope :search, lambda { |query_string|
    if query_string.blank?
      {:conditions => ["1 != 1"]}
    else
      { :conditions => ["(title LIKE ? OR body_html LIKE ?) AND private = ?", "%#{query_string}%", "%#{query_string}%", false]}
    end
  }

end
