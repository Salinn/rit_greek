class UserOrganization < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :organization_id
end
