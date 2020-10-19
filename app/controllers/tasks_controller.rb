class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    if !current_user.is_admin
      redirect_to '/welcome'
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.is_complete = false


    respond_to do |format|
      if @task.save
        format.html { redirect_to welcome_path }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to welcome_path }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # def complete_task(model,id,field,value)
  #   @model_var = model.find(id)
  #   @model_var.update_attributes(field: value)
  # end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to welcome_path }
      format.json { head :no_content }
    end
  end

  def complete
    @task.update_attribute(:is_complete, true)
    redirect_to '/welcome'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :due_date, :is_complete, :user_id, :category)
    end
end
