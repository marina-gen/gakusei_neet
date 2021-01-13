class SchedulesController < ApplicationController
    def index
        
    end
    def create
        schedule = Schedules.new(schedule_params)
    
        schedule.save!
        redirect_to("")#リダイレクト先URL

    end

    def schedule_params
        params.require(:schedule).permit(:name, :startdate, :memo)
    end
end

