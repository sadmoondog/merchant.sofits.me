module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Intellectmoney
        module Common
          def generate_signature_string
            "#{params['eshopId']}::#{params['orderId']}::#{params['serviceName']}::#{params['purchaseAmount']}::#{params['currency']}::11111"
          end

          def generate_signature
            Digest::MD5.hexdigest(generate_signature_string)
          end
        end
      end
    end
  end
end
