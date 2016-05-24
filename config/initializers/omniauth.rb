# require 'doorkeeper'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :doorkeeper,"8e250d7fcc368ee65bad0e40db99571c8237798f01c07412325671d5674b9dc5", "a91c70cc9d9a27abc6217ed22db3f02f956b8258b7effbf5af05fed2b96dac84"
end