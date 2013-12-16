module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Intellectmoney
        module Common
          def generate_signature_string
            "#{params['eshopId']}::#{params['orderId']}::#{params['serviceName']}::#{params['purchaseAmount']}::#{params['currency']}::#{secret}"
          end

          def generate_result_signature_string
            "#{params['eshopId']}::#{params['orderId']}::#{params['serviceName']}::#{params['eshopAccount']}::#{params['recipientAmount']}::#{params['recipientCurrency']}::#{params['paymentStatus']}::#{params['userName']}::#{params['userEmail']}::#{params['paymentData']}::#{secret}"
          end

          def generate_signature
            Digest::MD5.hexdigest(generate_signature_string)
          end

          def generate_result_signature
            Digest::MD5.hexdigest(generate_result_signature_string)
          end
        end
      end
    end
  end
end
