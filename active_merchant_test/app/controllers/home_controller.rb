class HomeController < ApplicationController
  include ActiveMerchant::Billing::Integrations

  skip_before_filter :verify_authenticity_token

  before_filter :create_notification

  def index
  end

  def result
    render :text => "OK"
    puts '----------------------------------------'
    puts "#{params}"
    puts '----------------------------------------'
  end

  def pay

  end

  def success
    render :text => "#{params}"
  end

  def fail
    render :text => "#{params}"
  end

  def create_notification
    @notification = Intellectmoney::Notification.new(request.raw_post, :secret => '11111')
  end
end
