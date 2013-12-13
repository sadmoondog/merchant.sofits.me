module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Intellectmoney
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          include Common

          def initialize(order, account, options = {})
            super
          end

          def form_fields
            @fields.merge(ActiveMerchant::Billing::Integrations::Intellectmoney.signature_parameter_name => generate_signature)
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
        end
      end
    end
  end
end
