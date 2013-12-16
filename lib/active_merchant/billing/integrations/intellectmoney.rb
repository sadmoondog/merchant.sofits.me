module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      # Documentation:
      # https://www.intellectmoney.ru/ru/enter/docs/documentation/
      module Intellectmoney
        autoload :Helper, File.dirname(__FILE__) + '/intellectmoney/helper.rb'
        autoload :Notification, File.dirname(__FILE__) + '/intellectmoney/notification.rb'
        autoload :Common, File.dirname(__FILE__) + '/intellectmoney/common.rb'

        mattr_accessor :test_url
        self.test_url = "https://merchant.intellectmoney.ru/ru/"

        mattr_accessor :production_url
        self.production_url =  "https://merchant.intellectmoney.ru/ru/"

        mattr_accessor :signature_parameter_name
        self.signature_parameter_name = 'hash'

        def self.service_url
          mode = ActiveMerchant::Billing::Base.integration_mode
          case mode
            when :production
              self.production_url
            when :test
              self.test_url
            else
              raise StandardError, "Integration mode set to an invalid value: #{mode}"
          end
        end

        def self.helper(order, account, options = {})
          Helper.new(order, account, options)
        end

        def self.notification(query_string, options = {})
          Notification.new(query_string, options)
        end

        def self.return(query_string)
          Return.new(query_string)
        end
      end
    end
  end
end
