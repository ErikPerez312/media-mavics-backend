class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :update, :destroy]

  # GET users/:user_id/campaigns
  def index
    # @campaigns = Campaign.all
    @campaigns = Campaign.where(user_id: params[:user_id])

    render json: @campaigns
  end

  # GET users/:user_id/campaigns/:campaign_id
  def show
    render json: @campaign
  end

  # POST users/:user_id/campaigns
  def create
    # byebug
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user

    if @campaign.save
      render json: @campaign, status: :created, location: user_campaign_path(id: @campaign.user.id)
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT users/:user_id/campaigns/:campaign_id
  def update
    if @campaign.update(campaign_params)
      render json: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # DELETE users/:user_id/campaigns/:campaign_id
  def destroy
    @campaign.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      byebug
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def campaign_params
      params.permit(
        :current_status,
        :total_cost,
        :exposure_view_count,
        :video_focus_people,
        :video_focus_product,
        :video_duration,
        :video_title,
        :video_link_url,
        :video_like_count,
        :video_comment_count,
        :video_share_count,
        :user_id,
        :qr_code_scan_count
        # :campaign
      )
    end
end
