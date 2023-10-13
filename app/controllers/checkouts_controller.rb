class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def new
    redirect_to leads_path if current_user.subscribed?
  end

  def create
    session =
      Stripe::Checkout::Session.create(
        {
          line_items: [
            {
              price: Rails.application.credentials.dig(:stripe, :price_id),
              quantity: 1
            }
          ],
          mode: "payment",
          metadata: {
            user_id: current_user.id
          },
          customer_email: current_user.email,
          success_url: root_url,
          cancel_url: checkout_url
        }
      )
    redirect_to session.url, status: :see_other, allow_other_host: true
  end
end
