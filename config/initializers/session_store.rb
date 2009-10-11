# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tarx_session',
  :secret      => '3479180b0c126b15fd5afb259c923334ff5f2c929010ecd672beb3669d57bf888f22d54271c21d05613a6632790feda0da244d4e4d55a97c9618b8aa2b991df7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
