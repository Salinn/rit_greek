module PhilanthropiesHelper
  def organization_total_raised(organization)
    total = 0
    seen = []
    organization.users.each do |user|
      test =  user.events.where(type_of_event: 'Philanthropy')
      test.each do |event|
        if event.philanthropies.any? && !seen.include?(event.philanthropies.first.id)
          total += event.philanthropies.first.total_raised
          seen.push(event.philanthropies.first.id)
        end
      end
    end
    total
  end

  def get_events(organization)
    events = []
    organization.users.each do | user |
      user.events.each do | event |
        if event.type_of_event == 'Philanthropy' && !events.include?(event)
          events.push(event)
        end
      end
    end
    events
  end
end
