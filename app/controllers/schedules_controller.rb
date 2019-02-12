class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.available(params[:gender])

    respond_to do |format|
      format.json { render json: @schedules }
      format.js   { render layout: false }
    end
  end
end
