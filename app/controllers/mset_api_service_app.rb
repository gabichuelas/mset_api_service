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
end
