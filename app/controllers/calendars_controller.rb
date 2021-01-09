class CalendarsController < ApplicationController
  def index
    d = DateTime.current.beginning_of_day  # 今日の0:00
    nd = d + 1  # 明日
    m = DateTime.current.beginning_of_month  # 今月の初日
    nm = DateTime.current.next_month.beginning_of_month  # 翌月の初日
    month_day = d.end_of_month.mday.to_i  # 今月は何日あるか
    m_copy = m

    # 今月予定のある日を取得
    m_sched = Schedule.where("startdate < ? AND enddate >= ?", params[:nm], params[:m]).order(startdate: :asc)
    @marks = Array.new(month_day, 0)
    cnt = 0
    (0..(@marks.length-1)).each do |num|
      loop do
        if m_sched[cnt].startdate >= (m_copy + 1) then
          break  # 先の予定だから日付を進めるため、ループを抜ける
        end
        if m_sched[cnt].enddate < m_copy then
          cnt = cnt + 1  # 過ぎた予定だから次の予定をみる
          next
        end
        
        @marks[num] = 1  # この日は予定がある
        break
      end

      m_copy = m_copy + 1  # 日付を進める
    end

    # 今日の予定を取得
    @schedules = Schedule.where("startdate < ? AND enddate >= ?", params[:nd], params[:d]).order(startdate: :asc)
  end
end
