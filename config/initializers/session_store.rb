# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_iiframe_session',
  :secret      => '66a6fa9eed0651563a87b94a1ee1f9ee40ab274df2eda6b87875dcc21c56c473ca5ad1ec0f17b9fb7343f62f14fb68a380289ca54d068e1d1cb31a249c5e364d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
