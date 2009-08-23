class Document < ActiveRecord::Base
  belongs_to :doclate, :counter_cache => true
  belongs_to :user, :counter_cache => true

  attr_accessible :title, :body_markdown

  validates_presence_of     :title, :body_markdown
  validates_length_of       :title, :maximum => 255

  before_save :generate_body_html

  named_scope :last_updated, :order => "updated_at DESC", :limit => 5

  def self.per_page
    3
  end

  def self.replace_fields(fields, text)
    text.gsub(/[{]{2}([^{]+)[}]{2}/) do |s|
      params = $1.split('|').collect(&:strip)

      field_title = params[0][/\A[']{1}(.+)[']{1}\z/, 1]
      value_index = fields['title'].index(field_title)

      (value_index.blank?) ? '' : fields['value'][value_index]
    end
  end

  private
  def generate_body_html
    self.body_html = Maruku.new(self.body_markdown).to_html
  end

  def self.doclate_field_to_value(id, str)
#    params = str.split('|').collect(&:strip)
#
#    field_id      = id
#    field_type    = params.pop
#    field_title   = params[0][/\A(&#8216;|&#8217;){1}(.+)(&#8216;|&#8217;){1}\z/, 2]
#    field_options = (params[1].blank?) ? '...' : params[1][/\A(&#8216;|&#8217;){1}(.+)(&#8216;|&#8217;){1}\z/, 2]
#
#    "<span id=\"dochub-textfield-#{field_id}\" class=\"dochub-placeholder #{field_type}\" title=\"#{field_title}\">#{field_options}</span>"
  end

end
