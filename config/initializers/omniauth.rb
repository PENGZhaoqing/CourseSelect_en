# require 'doorkeeper'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :doorkeeper,"3b6c4adda378463f79624afb72cf285d23de09a170247424e51ace0951166a6f", "d22c97a9df2ea3ae798cb3201f3a74806093b4c87a11cc940cc4b88e8898f78b"
end