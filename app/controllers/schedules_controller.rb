class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.where(scheduled_to: 1.day.from_now..12.days.from_now).available(params[:gender]).order(scheduled_to: :asc)

    respond_to do |format|
      format.json { render json: @schedules }
      format.js   { render layout: false }
    end
  end
end
