class SchedulesController < ApplicationController
    
    def new
        @schedule = Schedule.new
    end
    
    def index
        #@schedule = Schedules.all
        
    end
    def create
        @schedule = Schedule.new(schedule_params)
    
        if @schedule.save
            render 'index'
        else
            render 'new'
        end

        #flash[:notice] = "スケジュール「#{schedule.name}」登録しました。"
        #redirect_to action: :index
        

    end

    private

        def schedule_params
            params.require(:schedule).permit(:name, :startdate)
        end
end

