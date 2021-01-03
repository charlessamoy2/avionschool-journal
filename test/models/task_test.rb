require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @category = categories(:business)
    @task = Task.new
  end

  test "should receive error if Name is invalid" do
    @task.save

    assert_not @task.save
    assert @task.errors.full_messages.include?  "Name can't be blank"
    assert @task.errors.full_messages.include? "Category ID can't be blank"
  end

  test "should have no error if Category Id exists" do
    task = Task.new(name: "Task Name", category_id: @category.id)

    assert task.save
  end

  test "should return true if the task is started" do
    started_task = tasks(:started_task)

    assert started_task.started?
  end

  test "should return true if the task is completed" do
    completed_task = tasks(:completed_task)

    assert completed_task.completed?
  end
end
