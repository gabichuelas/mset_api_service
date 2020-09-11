get '/test' do
  "Hello World"
end

# faraday calls out to external api's
# paths are endpoints that must match the ones in rails app
# what the block returns is what we want to show up in rails app.
