class Copy < ActiveRecord::Base
  belongs_to :doclate
  belongs_to :copy, :class_name => 'Doclate'
end
