# require 'doorkeeper'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :doorkeeper,"b90cd219e59d98ff056f1cafe8a1afab0c005e2c25acf4747930273762482586", "b88432728760ff5d129004cdcd9d0dd76ca7e3316ac7c98c6d97dca99ab022ab"
end