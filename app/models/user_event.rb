class UserEvent < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :event_id
end
