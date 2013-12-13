module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Intellectmoney
        class Return < ActiveMerchant::Billing::Integrations::Return
          def item_id
            @params['orderId']
          end

          def amount
            @params['recipientAmount']
          end
        end
      end
    end
  end
end
