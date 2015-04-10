class Event < ActiveRecord::Base
  has_many :user_organizations
  has_many :users, through: :user_organizations

  has_many :community_services
  has_many :philanthropies
end
