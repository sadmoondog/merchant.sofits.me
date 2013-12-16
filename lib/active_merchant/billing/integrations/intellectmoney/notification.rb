module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Intellectmoney
        class Notification < ActiveMerchant::Billing::Integrations::Notification

          def secret
            @options[:secret]
          end

          def security_key
            params[ActiveMerchant::Billing::Integrations::Intellectmoney.signature_parameter_name].to_s.downcase
          end

          def acknowledge(authcode = nil)
            string = [
                params[:eshopId],
                params[:orderId],
                params[:serviceName],
                params[:eshopAccount],
                params[:recipientAmount],
                params[:recipientCurrency],
                params[:paymentStatus],
                params[:userName],
                params[:userEmail],
                params[:paymentData],
                @options[:secret]
            ].join '::'
            security_key == Digest::MD5.hexdigest(string)
          end
        end
      end
    end
  end
end
