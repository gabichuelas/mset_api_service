class MsetApiService < Sinatra::Base
# set headers for responses to send back as json
# maybe a before_action / before_block?
# response.headers["Content-Type"] = application/json

  get '/sym_search' do
    response = FdaService.new.symptom_search(params[:product_ndc])
    response.body
  end

  get '/med_search' do
    response = FdaService.new.brand_name_search(params[:medication_name])
    response.headers["Content-Type"] = "application/json"
    response.body
  end
end
