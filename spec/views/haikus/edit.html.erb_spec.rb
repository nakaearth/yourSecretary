require 'spec_helper'

describe "haikus/edit.html.erb" do
  before(:each) do
    @haiku = assign(:haiku, stub_model(Haiku,
      :title => "MyString",
      :sentence => "MyString",
      :user_id => 1,
      :point => 1
    ))
  end

  it "renders the edit haiku form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => haikus_path(@haiku), :method => "post" do
      assert_select "input#haiku_title", :name => "haiku[title]"
      assert_select "input#haiku_sentence", :name => "haiku[sentence]"
      assert_select "input#haiku_user_id", :name => "haiku[user_id]"
      assert_select "input#haiku_point", :name => "haiku[point]"
    end
  end
end
