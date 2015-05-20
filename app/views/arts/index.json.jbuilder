json.array!(@arts) do |art|
  json.extract! art, :id, :title
  json.url art_url(art, format: :json)
end
