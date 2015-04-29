class Event < ActiveRecord::Base
  has_many :user_organizations
  has_many :users, through: :user_organizations

  has_many :community_services, dependent: :destroy
  accepts_nested_attributes_for :community_services
  has_many :philanthropies, dependent: :destroy

  EventTypes = ['Community Service','Philanthropy']
end
