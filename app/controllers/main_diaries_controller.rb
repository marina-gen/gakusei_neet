class MainDiariesController < ApplicationController
  def index
    @diaries = MainDiary.all

  end

  def new
    @diary = MainDiary.new
  end

  def create
    @diaries = MainDiary.new(diary: params[:diary],today: params[:today])            
    @diaries.save
    redirect_to('/main_diaries/index')
  end
end
