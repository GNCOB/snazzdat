class RetailerProxy < ActiveRestClient::ProxyBase
  get "/locations" do
    response = passthrough
    translate(response) do |body|
      body['_res'] = body.delete('RetailigenceAPIResult')
    end
  end
end


class Retailer < ActiveRestClient::Base
  proxy RetailerProxy
  base_url LibConstants::RETAILIGENCE_BASE_URI

  get :all, "/locations", defaults: {apikey: LibConstants::RETAILIGENCE_API_KEY, requestorid: LibConstants::RETAILIGENCE_REQUEST_ID}

  def names
    self.try(:results).try(:items).try(:map){|n|n['Retailer']['name']}
  end

end
