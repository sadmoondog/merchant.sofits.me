module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Intellectmoney
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          include Common

          def initialize(order, account, options = {})
            @intellectmoney_options = options.dup
            super
            @intellectmoney_options.each do |key, value|
              add_field mappings[key], value
            end
          end

          def form_fields
            @fields
          end

          def params
            @fields
          end

          mapping :shop_id, 'eshopId'
          mapping :order_id, 'orderId'
          mapping :currency, 'recipientCurrency'
          mapping :amount, 'recipientAmount'
          mapping :username, 'userName'
          mapping :user_email, 'user_email'
          mapping :description, 'serviceName'
          mapping :fail_url, 'failUrl'
          mapping :success_url, 'successUrl'
          mapping :back_url, 'backUrl'
          mapping :hash_key, 'hash'
        end
      end
    end
  end
end
