module Admin
  class ListenersController < ApplicationController
    before_action :set_listener, only: [:show, :edit, :update, :destroy]

    def index
      @listeners = Listener.all
    end

    def show
    end

    def new
      @listener = Listener.new
    end

    def edit
    end

    def create
      @listener = Listener.new(listener_params)

      respond_to do |format|
        if @listener.save
          format.html { redirect_to [:admin, @listener], notice: 'Listener was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @listener.update(listener_params)
          format.html { redirect_to [:admin, @listener], notice: 'Listener was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @listener.destroy

      respond_to do |format|
        format.html { redirect_to admin_listeners_url, notice: 'Listener was successfully destroyed.' }
      end
    end

    private

    def set_listener
      @listener = Listener.find(params[:id])
    end

    def listener_params
      params.require(:listener).permit(:name, :email, :phone, :gender)
    end
  end
end
