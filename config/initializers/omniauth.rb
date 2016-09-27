# require 'doorkeeper'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :doorkeeper,"26322d2e8b1a9f1c4aa90e564c2d75b88284820189205c69e489c0bd56f3ab06", "4a95f5bc3abe35b39307cf8540bab66fe8cedad94f174ab6724fcfccac502bc4"
end