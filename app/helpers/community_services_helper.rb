module CommunityServicesHelper
  def organization_total_hours(organization)
    total = 0
    organization.users.each do |user|
      test =  user.events.where(type_of_event: 'Community Service')
      test.each do |event|
        total += event.community_services.first.total_hours
      end
    end
    total
  end
end
