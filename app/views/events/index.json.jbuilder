json.array!(@events) do |event|
  json.extract! event, :id, :name, :type_of_event, :start, :end
  json.url event_url(event, format: :json)
end
