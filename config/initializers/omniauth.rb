# require 'doorkeeper'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :doorkeeper,"49872fd20425010224157c80cd362af2a8c12a9849e74efbe72f3b7e78e7948c", "c25551f6490cc7a98a0006e1698fe7b20c267606b70fc61dc6679f3aabd67b25"
end