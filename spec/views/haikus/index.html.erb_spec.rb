require 'spec_helper'

describe "haikus/index.html.erb" do
  before(:each) do
    assign(:haikus, [
      stub_model(Haiku,
        :title => "Title",
        :sentence => "Sentence",
        :user_id => 1,
        :point => 1
      ),
      stub_model(Haiku,
        :title => "Title",
        :sentence => "Sentence",
        :user_id => 1,
        :point => 1
      )
    ])
  end

  it "renders a list of haikus" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sentence".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
