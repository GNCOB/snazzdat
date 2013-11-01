  Retailigence.configure do |config|
    if Rails.env.production?
      API_KEY = '9ueu6I9fHzu-jXzNzTt2toBXBVBBstxr'
      BASE_URI = 'http://api.retailigence.com/v2.0'
    else
      API_KEY = 'aIzdHVPfx5e20bav-Lx7xtdP7MK7usst'
      BASE_URI = 'http://apitest.retailigence.com/v2.0'
    end

    config.api_key = API_KEY
    config.base_uri = BASE_URI
  end
