module Admin
  class DashboardController < ApplicationController
    def index
      @talkers_without_schedule = Talker.without_schedule
    end
  end
end
