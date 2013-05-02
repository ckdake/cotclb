require 'gapps_openid'
require 'omniauth-google-apps'

# Force store to be generated
OpenID::SimpleSign.store

# Reconnect to the database, whose connection may have been tainted by the
# called to OpenID::SimpleSign.store
ActiveRecord::Base.connection.disconnect! if ActiveRecord::Base.connected?
ActiveRecord::Base.establish_connection
