json.array!(@new_biosensors) do |new_biosensor|
  json.extract! new_biosensor, :id
  json.url new_biosensor_url(new_biosensor, format: :json)
end
