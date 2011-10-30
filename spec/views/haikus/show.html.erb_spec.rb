require 'spec_helper'

describe "haikus/show.html.erb" do
  before(:each) do
    @haiku = assign(:haiku, stub_model(Haiku,
      :title => "Title",
      :sentence => "Sentence",
      :user_id => 1,
      :point => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sentence/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
