class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort_expired]
      @tasks = Task.all.order(time_limit: :desc)
    elsif params[:title].blank? && params[:completed]
      @tasks = Task.where('completed LIKE ?', "%#{params[:completed]}%").order(created_at: :desc)
    elsif params[:title] && params[:completed].blank?
      @tasks = Task.where('title LIKE ?', "%#{params[:title]}%").order(created_at: :desc)
    elsif params[:title] && params[:completed]
      @tasks = Task.where('title LIKE ?', "%#{params[:title]}%").where('completed LIKE ?', "%#{params[:completed]}%").order(created_at: :desc)
    else
      @tasks = Task.all.order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :time_limit, :completed)
  end
end
