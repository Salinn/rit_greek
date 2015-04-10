class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :recoverable, :rememberable, :trackable

  has_one :user_organizations
  has_one :organization, through: :user_organizations

  has_many :user_events
  has_many :events, through: :user_events
end
