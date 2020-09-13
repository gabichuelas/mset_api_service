class FdaService

  def brand_name_search(params)
    response = conn.get("drug/ndc.json?search=brand_name_base:#{params}&limit=10")
    json_parse(response)[:results]
  end

  private

  def json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.fda.gov/')
  end
end
