class MsetApiService < Sinatra::Base

  get '/sym_search' do
    # product_labeling: OPEN FDA SEARCH BY PRODUCT_NDC
    response = FdaService.new.symptom_search(params[:product_ndc])
    response.body

    # product_labeling: ADVERSE_EVENTS ENDPOINT
    # response = FdaService.new.adverse_reactions_table(params[:product_ndc])
    # response.body
  end

  get '/med_search' do
    response = FdaService.new.brand_name_search(params[:medication_name])
    response.body
  end
end
