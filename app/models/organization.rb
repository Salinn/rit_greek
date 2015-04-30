class Organization < ActiveRecord::Base
  require 'csv'

  has_many :user_organizations
  has_many :users, through: :user_organizations

  def self.import(file, organization)
    #http://richonrails.com/articles/importing-csv-files
    CSV.foreach(file.path, headers: true) do |row|

      user_hash = row.to_hash # exclude the price field
      user = User.find_or_create_by(login: user_hash["login"])

      UserOrganization.find_or_create_by(user: user, organization: organization)
    end # end CSV.foreach
  end # end self.impo
end
