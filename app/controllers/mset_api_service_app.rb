class MsetApiService < Sinatra::Base

  get '/med_search' do
    response = FdaService.new.brand_name_search(params[:medication_name])
    response.body
  end

  ## TEST CALLS

  get '/' do
    "HOME"
  end

  get '/test' do
    "Hello World"
  end

  get '/test2' do
    params[:med_name]
  end

  ## ACTUAL API CALLS

  # get '/med_search' do
  #   # this is just an example... need to fill in with actual search code.
  #   # Then we can refactor later.
  #
  #   med_name = params[:med_name]
  #
  #   conn = Faraday.new('https://api.fda.gov/drug/ndc.json')
  #   response = conn.get("?search=brand_name:#{med_name}")
  #
  #   JSON.parse(response.body, symbolize_names: true)
  # end
end
