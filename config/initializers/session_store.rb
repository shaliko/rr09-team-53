# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dochub_session',
  :secret      => '92ea91f207d00444c527e02a80cd426057cb2b13f6e748082440ee8f8c364ed42c5e170f739766bcbe6ea21c0f41e3b7adc664e38fbf9638c8a1a6900c7f5af5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
