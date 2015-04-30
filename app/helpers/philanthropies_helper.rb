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
end
