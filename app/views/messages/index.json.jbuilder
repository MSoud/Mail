json.array!(@users) do |message|
  json.extract! message, :id
  json.url message_url(message, format: :json)
end
