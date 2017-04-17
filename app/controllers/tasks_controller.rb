class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  def index
     @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスクが登録されました'
      redirect_to @task
    else
      flash.now[:danger]='タスクを登録できませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'タスクが更新されました'
      redirect_to @task
    else
      flash.now[:danger]='タスクを更新できませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    flash[:success]='削除しました'
    redirect_to tasks_url
  end
  
private

  def set_task
    @task = Task.find(params[:id])
  end

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
end