module Admin
  module Schedules
    class FinishController < ApplicationController
      def new
        @schedule = Schedule.pending_occurrence.find(params[:id])
      end

      def create
        @schedule = Schedule.pending_occurrence.find(params[:id])
        finisher = ::ScheduleFinisher.new(@schedule, finish_params)

        respond_to do |format|
          if finisher.call
            format.html { redirect_to admin_schedule_path(@schedule), notice: 'Escuta empática finalizada com sucesso.' }
          else
            format.html { render :new }
          end
        end
      end

      private


      def finish_params
        params.require(:schedule).permit(:occurred_at, :duration)
      end
    end
  end
end
