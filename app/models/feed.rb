class Feed < ActiveRecord::Base
  module Types
    CREATE_DOCLATE = 'create' # [user] [create] [doclate]
    UPDATE_DOCLATE = 'update' # [user] [update] [doclate]
    DELETE_DOCLATE = 'delete' # [user] [delete] [doclate_title]
    FORK_DOCLATE   = 'fork'   # [user] [fork]   [doclate]
    FOLLOW         = 'follow' # [user] [follow] [user]

    ALL = [CREATE_DOCLATE, UPDATE_DOCLATE, DELETE_DOCLATE, FORK_DOCLATE, FOLLOW]
  end

  belongs_to :user
  belongs_to :subject,  :polymorphic => true

end
