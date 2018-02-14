class DashboardsController < ApplicationController
  before_action :set_page, only:[:show, :edit, :update, :destroy]
  skip_before_action :require_login, raise: false

  def index
    puts "Index called"
  end

  def show
    @video_styles = VideoStyle.all
  end

  # def video_style


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @style = VideoStyle.find(params[:id])
    end

end
