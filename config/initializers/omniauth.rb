# require 'doorkeeper'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :doorkeeper,"b2e7b364245f32c045584f7cdc997411e7019e34ecc2d146e8ad29c054be48b8", "c57343cecc3a41e2fd17226db5d066a2b5a37a33572699b0b4881854f855c0b3"
end