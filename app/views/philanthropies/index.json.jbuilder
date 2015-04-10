json.array!(@philanthropies) do |philanthropy|
  json.extract! philanthropy, :id, :event_id, :total_raised
  json.url philanthropy_url(philanthropy, format: :json)
end
