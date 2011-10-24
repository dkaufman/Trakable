class MetricsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @habit = @user.habits.find(params[:habit_id])
    @metric = @habit.metrics.new(params[:metric])
    if @metric.save
      redirect_to [@user, @habit], :notice => "Metric created!"
    else
      render "new"
    end
  end
    
  def add_datapoint
    @user = User.find(params[:user_id])
    @habit = @user.habits.find(params[:habit_id])
    @metric = @habit.metrics.find(params[:id])
    @hash = @metric.observation_record
    if @hash
      @hash[Time.now.ctime] = {:observation_day => params[:observation_day], :observation_time => params[:observation_time],
                               :observation => params[:observation]}
    else
      @hash = {Time.now.ctime => {:observation_day => params[:observation_day], :observation_time => params[:observation_time],
                                  :observation => params[:observation]}}
    end
    if @metric.update_attributes(:observation_record => @hash)
      redirect_to [@user, @habit, @metric], :notice => "Observation created!"
    else
      render "show"
    end
  end
  
  def new
    @user = User.find(params[:user_id])
    @habit = @user.habits.find(params[:habit_id])
    @metric = Metric.new
  end
  
  def show
    @user = User.find(params[:user_id])
    @habit = @user.habits.find(params[:habit_id])
    @metric = @habit.metrics.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:user_id])
    @habit = @user.habits.find(params[:habit_id])
    @metric = @habit.metrics.find(params[:id])
  end
  def update
    @user = User.find(params[:user_id])
    @habit = @user.habits.find(params[:habit_id])
    @metric = @habit.metrics.find(params[:id])
    if @metric.update_attributes(params[:metric])
      redirect_to([@user, @habit, @metric], :notice => 'Metric was successfully updated.')
    else
      render :action => "edit"
    end      
  end
end


