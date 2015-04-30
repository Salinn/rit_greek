class Organization < ActiveRecord::Base
  require 'csv'

  has_many :user_organizations
  has_many :users, through: :user_organizations

  def self.import(file, organization)
    #http://richonrails.com/articles/importing-csv-files
    user_ids = []
    CSV.foreach(file.path, headers: true) do |row|

      user_hash = row.to_hash # exclude the price field
      user = User.find_or_create_by(login: user_hash["login"])

      user_ord_id = UserOrganization.find_or_create_by(user: user, organization: organization)
      user_ids.push(user_ord_id.id)
    end # end CSV.foreach
    users = UserOrganization.where(organization: organization)
    users.each do |user|
      if user_ids.include? user.id
        user_ids.delete(user.id)
      else
        user.destroy
      end
    end
  end # end self.impo
end
