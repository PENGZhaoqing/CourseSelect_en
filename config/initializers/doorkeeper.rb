require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, 'doorkeeper'
      option :client_options, {
          site: ApplicationHelper::PROVIDER_DOMAIN,
          authorize_url: ApplicationHelper::OAUTHORIZE_URL
      }

      uid {
        raw_info['user']['id']
      }

      info do
        {
            name: raw_info['user']['name'],
            num: raw_info['user']['number'],
            role: raw_info['user']['role'],
            email: raw_info['user']['email'],
            major: raw_info['user']['major'],
            department: raw_info['user']['department'],
            node: raw_info['access']['node'],
            path: raw_info['access']['path'],
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