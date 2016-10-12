module Admin
  module Schedules
    class FinishController < ApplicationController
      def new
        @schedule = Schedule.pending_occurrence.find(params[:id])
      end
    end
  end
end
