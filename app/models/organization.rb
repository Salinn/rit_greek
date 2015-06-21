class Organization < ActiveRecord::Base
  require 'csv'

  has_many :user_organizations
  has_many :users, through: :user_organizations

  def self.import(file)
    #http://richonrails.com/articles/importing-csv-files
    user_ids = []
    user_organizations = []
    CSV.foreach(file.path, headers: true) do |row|

      user_hash = row.to_hash # exclude the price field
      login = user_hash["EMAIL (RIT)"][/[^@]+/]
      user = User.find_or_create_by(login: login)
      organization = Organization.find_or_create_by(name: user_hash["FRAT/SOR"])

      user_ord_id = UserOrganization.find_or_create_by(user: user, organization: organization)
      user_ids.push(user_ord_id.id)
      user_organizations.push(organization) unless user_organizations.include?(organization)
    end # end CSV.foreach
    user_organizations.each do |organization|
      users = UserOrganization.where(organization: organization)
      users.each do |user|
        if user_ids.include? user.id
          user_ids.delete(user.id)
        else
          user.destroy
        end
      end
    end
  end # end self.impo
end
