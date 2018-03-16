class EphemeralKeysController < ApplicationController
    skip_before_action :require_login, raise: false
    require('pp')
  # before_action :set_ephemeral_key, only: [:show, :update, :destroy]

  # POST /ephemeral_keys
  def create
    stripe_version = ephemeral_key_params['api_version']
    customer_id = ephemeral_key_params["customer_id"] # session['customer_id']

    # @key = Stripe::EphemeralKey.create(
    #   {customer: customer_id},
    #   {stripe_version: stripe_version}
    # )

    begin
    @key = Stripe::EphemeralKey.create(
      {customer: customer_id},
      {stripe_version: stripe_version}
    )
    rescue Stripe::StripeError => e
        status 402
        return log_info("Error creating ephemeral key: #{e.message}")
        render json: {"error": "Error creating ephemeral key: #{e.message}"}, status: => 402
    end

    render json: @key, status: :created
  end

  private
    # Only allow a trusted parameter "white list" through.
    def ephemeral_key_params
      params.permit(
        :customer_id,
        :api_version,
        :ephemeral_key
      )
    end
end
