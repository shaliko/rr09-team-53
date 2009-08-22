class Feed < ActiveRecord::Base
  module Types
    CREATE_TEMPLATE = 'create' # [user] [create] [template]
    UPDATE_TAMPLATE = 'update' # [user] [update] [template]
    DELETE_TEMPLATE = 'delete' # [user] [delete] [template_title]
    FORK_TEMPLATE   = 'fork'   # [user] [fork]   [template]
    FOLLOW          = 'follow' # [user] [follow] [user]

    ALL = [CREATE_TEMPLATE, UPDATE_TAMPLATE, DELETE_TEMPLATE, FORK_TEMPLATE, FOLLOW]
  end

  belongs_to :user
  belongs_to :subject,  :polymorphic => true

end
