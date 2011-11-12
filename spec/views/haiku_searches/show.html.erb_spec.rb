require 'spec_helper'

describe "haiku_searches/show.html.erb" do
  before(:each) do
    @haiku_search = assign(:haiku_search, stub_model(HaikuSearch,
      :sentence => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
