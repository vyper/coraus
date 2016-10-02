module Admin
  module Talkers
    class SchedulesController < ApplicationController
      before_action :load_dependencies, only: [:new, :create]

      def new
      end

      def create
        @schedule = @available_schedules.find(params[:schedule_id])
        scheduler = ::TalkerScheduler.new(@talker, @schedule)

        respond_to do |format|
          if scheduler.call
            format.html { redirect_to admin_talker_schedule_path(scheduler.talker), notice: 'Schedule was successfully updated.' }
          else
            format.html { render :new }
          end
        end
      end

      def show
        @talker = Talker.find(params[:talker_id])
        @schedule = @talker.schedule
      end

      private

      def load_dependencies
        @talker = Talker.without_schedule.find(params[:talker_id])
        @available_schedules = Schedule.available
      end
    end
  end
end
