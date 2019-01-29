class TalkersController < ApplicationController
  before_action :set_talker, only: :show

  def new
    @talker = Talker.new
  end

  def create
    @talker = Talker.new(talker_params)

    respond_to do |format|
      if @talker.save
        format.html { redirect_to @talker, notice: 'Talker was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  private
    def set_talker
      @talker = Talker.find(params[:id])
    end

    def talker_params
      params.require(:talker).permit(:name, :email, :phone, :forecast_at, :preferred_listener_gender)
    end
end
