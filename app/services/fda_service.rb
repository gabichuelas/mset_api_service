class FdaService

  def symptom_search(product_ndc)
    conn.get("drug/label.json?search=openfda.product_ndc.exact:#{product_ndc}")
  end

  def brand_name_search(medication_name)
    conn.get("drug/ndc.json?search=brand_name_base:#{medication_name}&limit=10")
  end

  private

  def json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.fda.gov/')
  end
end
