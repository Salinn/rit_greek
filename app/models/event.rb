class Event < ActiveRecord::Base
  has_many :users

  has_many :community_services, dependent: :destroy
  accepts_nested_attributes_for :community_services

  has_many :philanthropies, dependent: :destroy
  accepts_nested_attributes_for :philanthropies

  EventTypes = ['Community Service','Philanthropy']

  def community_services_total
    total = 0
    community_services.each { |event| total += event.total_hours }
    total
  end

  def philanthropies_total
    total = 0
    philanthropies.each { |event| total += event.total_raised }
    total
  end
end
