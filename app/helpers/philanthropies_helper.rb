module PhilanthropiesHelper
  def organization_total_raised(organization)
    total = 0
    organization.users do |user|
      total +=  user.events.where(type_of_event: 'Philanthropy').total_raised
    end
    total
  end
end
