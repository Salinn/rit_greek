module CommunityServicesHelper
  def organization_total_hours(organization)
    total = 0
    organization.users do |user|
      total +=  user.events.where(type_of_event: 'Community Service').total_hours
    end
    total
  end
end
