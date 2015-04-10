json.array!(@user_organizations) do |user_organization|
  json.extract! user_organization, :id, :user_id_id, :organization_id_id, :start_date, :end_date
  json.url user_organization_url(user_organization, format: :json)
end
