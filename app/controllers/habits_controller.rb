class HabitsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @habit = @user.habits.new(params[:habit])
    if @habit.save
      redirect_to @user, :notice => "Metric created!"
    else
      render "new"
    end
  end
  
  def new
    @user = User.find(params[:user_id])
    @habit = Habit.new
  end
  
  def show
    @user = User.find(params[:user_id])
    @habit = @user.habits.find(params[:id])
  end
  def edit
    @user = User.find(params[:user_id])
    @habit = @user.habits.find(params[:id])
  end
  def update
    @user = User.find(params[:user_id])
    @habit = @user.habits.find(params[:id])
    if @habit.update_attributes(params[:habit])
      redirect_to([@user, @habit], :notice => 'Habit was successfully updated.')
    else
      render :action => "edit"
    end      
  end
end
