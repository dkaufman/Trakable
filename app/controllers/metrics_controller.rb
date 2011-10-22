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


