module LibConstants

  if Rails.env.production?
    PARSE_APP_ID = 'cnsd7iD7AKBypKtPa2VqhlLl5N7M252FFqSQOtG3'
    PARSE_JS_KEY = 'R2gz5BYhOmqQKpRmiSGJYXDlu8u3NOeFXVoxNoCL'
  else
    PARSE_APP_ID = 'oxvU7BRJzsuOeXusB4wnWU7t3YZrWTFxJ2N5fj9g'
    PARSE_JS_KEY = 'CewakiunRwHgUruOztDv01Tjbo7lnueVxfx3G2vJ'
  end

  if Rails.env.production? || Rails.env.staging?
    FACEBOOK_APP_ID = '732984516719860'
  else
    FACEBOOK_APP_ID = '263789127131811'
  end

  RETAILIGENCE_REQUEST_ID = 'ab09b07155a1aa0a21a3701eebb6c3fc'

  if Rails.env.production?
    RETAILIGENCE_API_KEY = '9ueu6I9fHzu-jXzNzTt2toBXBVBBstxr'
    RETAILIGENCE_BASE_URI = 'http://api.retailigence.com/v2.1'
  else
    RETAILIGENCE_API_KEY = 'aIzdHVPfx5e20bav-Lx7xtdP7MK7usst'
    RETAILIGENCE_BASE_URI = 'http://apitest.retailigence.com/v2.1'
  end

end