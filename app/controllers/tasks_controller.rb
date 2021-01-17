class TasksController < ApplicationController
    def index
        @tasks = current_user.tasks
    end

    def new
        @task = current_user.tasks.build
    end

    def edit
        @task = current_user.tasks.find(params[:id])
    end

    def show
        @task = current_user.tasks.find(params[:id])
    end

    def create
        @task = current_user.tasks.build(task_params)

        if @task.save
            redirect_to tasks_path
        else
            render :new
        end
    end

    def update
        @task = current_user.tasks.find(params[:id])

        if @task.update(task_params)
            redirect_to tasks_path
        else
            render :edit
        end
    end

    def destroy
        @task = current_user.tasks.find(params[:id])

        if @task.destroy
            redirect_to tasks_path
        else
            render :edit
        end
    end

    private

    def set_task
        @task = current_user.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:name, :details, :deadline, :completed, :started, :category_id)
    end
end
