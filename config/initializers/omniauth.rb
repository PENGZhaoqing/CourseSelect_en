# require 'doorkeeper'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :doorkeeper,"1359396eeda34a5dc25e472c6b8d5a53680f62053bb9296d36812a7a07d32c54", "074dd7debfe5ff2aafec081e2a9f38df5a890df82afa737ea209f250a5add29b"
end