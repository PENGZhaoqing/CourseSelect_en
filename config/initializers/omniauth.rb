# require 'doorkeeper'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :doorkeeper,"bcbd21d235f47141f54e63315a9581b854c308bd02b43a6f3b98d27673cf6928", "d62b46a649a6f0a89267bb2a65104a7d1af194f4b65e34210e46a242d5a0bafb"
end