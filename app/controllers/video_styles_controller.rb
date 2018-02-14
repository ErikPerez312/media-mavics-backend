class VideoStylesController < ApplicationController
  before_action :set_video_style, only: [:show, :update, :destroy]
  skip_before_action :require_login
  #, only: [:create], raise: false

  # GET /video_styles
  def index
    @video_styles = VideoStyle.all

    respond_to do |format|
      format.html
      format.json { render json: @video_styles, status: :ok }
    end
  end

  def new
    @video_style = VideoStyle.new
    render template: "video_styles/new"
  end

  # GET /video_styles/1
  def show

    respond_to do |format|
      format.html
      format.json { render json: @video_style, status: :ok }
    end
    # render json: @video_style
  end

  # POST /video_styles
  def create
    @video_style = VideoStyle.new(video_style_params)

    if @video_style.save
      respond_to do |format|
        format.html
        format.json { render json: @video_style, status: :created }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: @video_style.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /video_styles/1
  def update
    respond_to do |format|
      if @video_style.update(video_style_params)
        format.html #{ redirect_to @video_style, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

    # if @video_style.update(video_style_params)
    #   render json: @video_style
    # else
    #   render json: @video_style.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /video_styles/1
  def destroy
    @video_style.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_style
      @video_style = VideoStyle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def video_style_params
      params.require(:video_style).permit(
        :name,
        :video_comments_count,
        :video_likes_count,
        :video_shares_count,
        :video_url,
        :thumbnail_url
      )
    end
end
