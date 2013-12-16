class HomeController < ApplicationController
  include ActiveMerchant::Billing::Integrations

  skip_before_filter :verify_authenticity_token

  before_filter :create_notification
  before_filter :find_payment, :only => [:result]

  def index
    unless Payment.order("created_at").last.nil?
      @last_order_id = Payment.order("created_at").last.id + 1
    else
      @last_order_id = 0
    end
  end

  def result
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
        ActiveMerchantTest::Application.config.intellectmoney_secret
    ].join '::'

    if params[:hash] == Digest::MD5.hexdigest(string)
      @payment.status = params[:paymentStatus]
      @payment.save
      render :text => "OK"
    else
      render :text => "error"
    end

  end

  def pay
    options = Hash.new
    options[:user_id] = 1
    options[:amount] = params[:recipientAmount]
    options[:service] = params[:serviceName]
    options[:status] = 0
    @payment = Payment.new(options)
    @payment.save
    render :text => "saved"
  end

  def success
    render :text => "#{params}"
  end

  def fail
    render :text => "#{params}"
  end

  private

  def create_notification
    @notification = Intellectmoney.notification(request.raw_post, :secret => ActiveMerchantTest::Application.config.intellectmoney_secret)
  end

  def find_payment
    @payment = Payment.find(params[:orderId])
  end
end
