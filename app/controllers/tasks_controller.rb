class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
PER = 4
  def index
    # binding.pry
    if params[:sort_expired] #終了期限でソート
      @tasks = current_user.tasks.order(time_limit: :desc).page(params[:page]).per(4)
    elsif params[:sort_priority] #優先順位でソート
      @tasks = current_user.tasks.order(priority: :asc).page(params[:page]).per(4)
    elsif params[:title].blank? && params[:completed].blank?
      @tasks = current_user.tasks.page(params[:page]).per(4)
    elsif params[:title].blank? && params[:completed]
      @completed = params[:completed].to_i
      @tasks = current_user.tasks.completed_search(@completed).page(params[:page]).per(4)
    elsif params[:title] && params[:completed].blank?
      @tasks = current_user.tasks.title_search(params[:title]).page(params[:page]).per(4)
    elsif params[:title] && params[:completed]
      @completed = params[:completed].to_i
      @tasks = current_user.tasks.title_search(params[:title]).completed_search(@completed).page(params[:page]).per(4)
    else
      @tasks = current_user.tasks.order(created_at: :desc).page(params[:page]).per(4)
    end
  end

  def show
  end

  def new
    @task = Task.new
  end


  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'タスクが作成されました' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'タスクが更新されました' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'タスクが削除されました' }
    end
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :time_limit, :completed, :priority, :name, label_ids: [])
  end
end
