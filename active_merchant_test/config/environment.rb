# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ActiveMerchantTest::Application.initialize!

ActiveMerchantTest::Application.config.intellectmoney_login = 'nk@sofits.me'
ActiveMerchantTest::Application.config.intellectmoney_secret = '11111'
