require File.expand_path('../../../config/environment',  __FILE__)

RSpec.describe 'med_search' do

  def app
    MsetApiService
  end

  it 'can search fda api for medications by name' do
    VCR.use_cassette('med_search_adderall') do
      params = 'Adderall'
      response = get "/med_search?medication_name=#{params}"
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:results].count).to eq(10)
      json[:results].each do |result|
        name = result[:brand_name]
        expect(name).to include(params)
      end
    end
  end

  it 'can search fda api for symptoms table for medication by produce_ndc' do
    VCR.use_cassette('sym_search_adderall') do
      params = '54092-381'
      response = get "/sym_search?product_ndc=#{params}"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:results][0].keys).to include(:adverse_reactions_table)
    end
  end
end
