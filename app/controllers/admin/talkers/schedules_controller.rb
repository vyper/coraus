module Admin
  module Talkers
    class SchedulesController < ApplicationController
      before_action :load_dependencies, only: [:new, :create]

      def new
      end

      def create
        @schedule = @available_schedules.find(params[:schedule_id])

        respond_to do |format|
          if @schedule.update(talker: @talker)
            format.html { redirect_to [:admin, @schedule], notice: 'Schedule was successfully updated.' }
          else
            format.html { render :new }
          end
        end
      end

      private

      def load_dependencies
        @talker = Talker.without_schedule.find(params[:talker_id])
        @available_schedules = Schedule.available
      end
    end
  end
end
