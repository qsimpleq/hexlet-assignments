require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    status = Task.statuses.sample
    completed = status == 'completed'

    @task_attributes = {
      name: Faker::Name.name_with_middle,
      description: Faker::Lorem.question,
      status:,
      creator: Faker::Name.name_with_middle,
      performer: Faker::Name.name_with_middle,
      completed:
    }

    @task = Task.create(@task_attributes)
  end

  test 'should get index' do
    get tasks_url

    assert_response :success
    assert_select 'h1', 'Tasks'
  end

  test "should get new" do
    get new_task_path

    assert_response :success
  end

  test 'should create task' do
    new_task_attributes = @task_attributes.dup
    new_task_attributes[:name] += '1'

    post tasks_url, params: { task: new_task_attributes }

    task = Task.find_by! name: new_task_attributes[:name]
    assert_redirected_to task_url(task)
  end

  test "should get task" do
    get task_url(@task)

    assert_response :success
  end

  test 'should get edit' do
    get edit_task_url(@task)
    assert_response :success
  end

  test 'should update task' do
    patch task_url(@task), params: { task: @task_attributes }
    assert_redirected_to task_url(@task)

    @task.reload
    assert { @task.name == @task_attributes[:name] }
  end

  test 'should destroy task' do
    delete task_url(@task)

    assert_redirected_to tasks_url

    assert { !Task.exists? @task.id }
  end
end
