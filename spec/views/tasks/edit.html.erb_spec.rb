require 'spec_helper'

describe "tasks/edit.html.erb" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :title => "MyString",
      :priority => 1,
      :user_id => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path(@task), :method => "post" do
      assert_select "input#task_title", :name => "task[title]"
      assert_select "input#task_priority", :name => "task[priority]"
      assert_select "input#task_user_id", :name => "task[user_id]"
    end
  end
end
