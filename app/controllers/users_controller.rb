class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # skip require_login method only when we are creating a user.f
  skip_before_action :require_login, only: [:create], raise: false

  # GET /users
  def index
    @users = User.all

    render json: @users
    # email = request.headers['email']
    # password = request.headers['password']
    # @user = User.new(email, password)
    # @user.authenticate()
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      create_stripe_customer(@user)

      render json: @user, except: removed_response_params() , status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def removed_response_params()
      return [
          :password_hash,
          :password_salt,
          :password
      ]
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(
        :name,
        :phone_number,
        :email,
        :business_name,
        :password
      )
    end

    def create_stripe_customer(user)
      @customer = Stripe::Customer.create(
        :description => "Customer for #{user.email}",
        :email => user.email
      )

      user.customer_id = @customer.id
      user.save

    end
end
