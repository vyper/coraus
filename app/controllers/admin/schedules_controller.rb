module Admin
  class SchedulesController < ApplicationController
    before_action :set_schedule, only: [:show, :edit, :update, :destroy]

    def index
      @schedules = Schedule.order(scheduled_to: :asc).all
    end

    def show
    end

    def new
      @schedule = Schedule.new
    end

    def edit
    end

    def create
      @schedule = Schedule.new(schedule_params)

      respond_to do |format|
        if @schedule.save
          format.html { redirect_to [:admin, @schedule], notice: 'Schedule was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @schedule.update(schedule_params)
          format.html { redirect_to [:admin, @schedule], notice: 'Schedule was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @schedule.destroy

      respond_to do |format|
        format.html { redirect_to admin_schedules_url, notice: 'Schedule was successfully destroyed.' }
      end
    end

    private

    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      params.require(:schedule).permit(:listener_id, :talker_id, :scheduled_to, :room_url, :occurred_at, :duration)
    end
  end
end
