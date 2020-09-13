RSpec.describe 'med_search', type: :request do

  def app
    Sinatra::Application
  end

  xit 'can search fda api for medications by name' do
    params = 'Adderall'
    get "/med_search?medication_name=#{params}"
    # how does testing work in here?? Can't get a response.
  end
end
