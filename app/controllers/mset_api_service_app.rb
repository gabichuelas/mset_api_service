class MsetApiService < Sinatra::Base

  get '/sym_search' do
    response = FdaService.new.symptom_search(params[:product_ndc])
    response.body
  end

  get '/med_search' do
    response = FdaService.new.brand_name_search(params[:medication_name])
    response.body
  end
end
