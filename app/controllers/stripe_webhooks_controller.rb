class StripeWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    event = nil
    payload = request.body.read
    sig_header = request.env["HTTP_STRIPE_SIGNATURE"]
    endpoint_secret =
      Rails.application.credentials.dig(:stripe, :webhook_signing_secret)

    begin
      event =
        Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      status 400
      return
    end

    case event.type
    when "checkout.session.completed"
      session = event.data.object

      @user = User.find_by(id: session.metadata.user_id)
      @user.update(subscribed: true)
    end
  end
end
