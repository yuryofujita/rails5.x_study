# Be sure to restart your server when you modify this file.

# Rails.application.config.session_store :cookie_store, key: '_app_session'
# Rails.application.config.session_store :cookie_store, key: '_project_session', domain: '.nsijapan.com'
# Rails.application.config.session_store :cookie_store, key: '_project_session', :domain => :all, :tld_length => 2
# Rails.application.config.session_store :cookie_store, key: '_project_session', :domain => :all
# Rails.application.config.session_store :cookie_store, key: '_project_session', :domain => :"lvh.me"

# "書き込みできない"
#Rails.application.config.session_store :cookie_store, key: '_project_session115', :domain => :all, :tld_length => 2

# "書き込みできる"
Rails.application.config.session_store :cookie_store, key: '_project_session117', :domain => :all

# "書き込みできない"
# Rails.application.config.session_store :cookie_store, key: '_project_session116', :domain => :"lvh.me"
