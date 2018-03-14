class EphemeralKeysController < ApplicationController
  # before_action :set_ephemeral_key, only: [:show, :update, :destroy]



  # POST /ephemeral_keys
  def create
    stripe_version = ephemeral_key_params['api_version']
    customer_id = ephemeral_key_params["customer_id"] # session['customer_id']

    key = Stripe::EphemeralKey.create(
      {customer: customer_id},
      {stripe_version: stripe_version}
    )
    key.to_json
  end

  private
    # Only allow a trusted parameter "white list" through.
    def ephemeral_key_params
      params.permit(
        :customer_id,
        :api_version
      )
    end
end
