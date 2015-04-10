class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, through: :user_events

  has_many :community_services
  has_many :philanthropies

  EVENTTYPES = ['Community Service','Philanthropy']
end
