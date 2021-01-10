class CalendarsController < ApplicationController
  def index
    d = DateTime.current.beginning_of_day  # 今日の0:00
    nd = d + 1  # 明日
    

    # 今日の予定を取得
    @schedules = Schedule.where("startdate < ? AND enddate >= ?", params[:nd], params[:d]).order(startdate: :asc)
  end
end
