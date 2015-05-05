module CommunityServicesHelper
  def organization_total_hours(organization)
    total = 0
    organization.users.each do |user|
      test =  user.events.where(type_of_event: 'Community Service')
      test.each do |event|
        if event.community_services.any?
          total += event.community_services.first.total_hours
        end
      end
    end
    total
  end

  def get_events(organization)
    events = []
    organization.users.each do | user |
      user.events.each do | event |
        if event.type_of_event == 'Community Service' && !events.include?(event)
            events.push(event)
        end
      end
    end
    events
  end
end
