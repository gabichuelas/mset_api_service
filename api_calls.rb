get '/test' do
  "Hello World"
end

get '/test2' do
  require "pry"; binding.pry
  params[:med_name]
end

# paths are endpoints that must match the ones in rails app
# what the block returns is what we want to show up in rails app.
