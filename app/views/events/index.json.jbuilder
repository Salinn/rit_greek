json.array!(@events) do |event|
  json.extract! event, :id, :name, :type_of_event, :user_event_id, :start, :end
  json.url event_url(event, format: :json)
end
