class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :update, :destroy]

  # GET /charges
  # def index
  #   @charges = Charge.all
  #
  #   render json: @charges
  # end
  #
  # # GET /charges/1
  # def show
  #   render json: @charge
  # end

  # POST /charges
  def create
    # @charge = Charge.new(charge_params)
    # if @charge.save
    #   render json: @charge, status: :created, location: @charge
    # else
    #   render json: @charge.errors, status: :unprocessable_entity
    # end

    Stripe::Charge.create(
        :amount => 2000,
        :currency => "usd",
        :customer => "tok_amex",
        :description => "Charge for #{params[:email]}"
    )
  end

  # DELETE /charges/1
  def destroy
    @charge.destroy
  end

  private
  # Only allow a trusted parameter "white list" through.
    def charge_params
      params.permit(
          :amount,
          :currency,
          :customer,
          :email
      )
    end
end
