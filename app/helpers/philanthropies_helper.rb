module PhilanthropiesHelper
  def organization_total_raised(organization)
    total = 0
    organization.users.each do |user|
      test =  user.events.where(type_of_event: 'Philanthropy')
      test.each do |event|
        total += event.community_services.first.total_raised
      end
    end
    total
  end
end
