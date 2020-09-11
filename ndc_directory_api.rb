get '/med_search' do
  # this is just an example... need to fill in with actual search code.
  # Then we can refactor later.
  
  med_name = params[:med_name]

  conn = Faraday.new('https://api.fda.gov/drug/ndc.json')
  response = conn.get("?search=brand_name:#{med_name}")

  JSON.parse(response.body, symbolize_names: true)
end

# faraday calls out to external api's
# paths are endpoints that must match the ones in rails app
# what the block returns is what we want to show up in rails app.
