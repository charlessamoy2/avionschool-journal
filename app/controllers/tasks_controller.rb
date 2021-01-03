class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def edit
        @task = Task.find(params[:id])
    end

    def show
        @task = Task.find(params[:id])
    end

    def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to tasks_path
        else
            render :new
        end
    end

    def update
        @task = Task.find(params[:id])

        if @task.update(task_params)
            redirect_to tasks_path
        else
            render :edit
        end
    end

    def destroy
        @task = Task.find(params[:id])

        if @task.destroy
            redirect_to tasks_path
        else
            render :edit
        end
    end

    private

    def set_task
        @task = Task.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:name, :details, :deadline, :completed, :started, :category_id)
    end
end
