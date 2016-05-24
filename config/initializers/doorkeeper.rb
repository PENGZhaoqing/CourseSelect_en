require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, 'doorkeeper'
      option :client_options, {
          site: 'http://localhost:3001',
          authorize_url: 'http://localhost:3001/oauth/authorize'
      }

      uid {
        raw_info['user']['id']
      }

      info do
        {
            name: raw_info['user']['name'],
            number: raw_info['user']['number'],
            role: raw_info['user']['role'],
            department: raw_info['user']['role'],
            node: raw_info['access']['node'],
            path: raw_info['access']['path']
        }
      end

      extra do
        {raw_info: raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end