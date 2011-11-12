require 'spec_helper'

describe "haiku_searches/index.html.erb" do
  before(:each) do
    assign(:haiku_searches, [
      stub_model(HaikuSearch,
        :sentence => ""
      ),
      stub_model(HaikuSearch,
        :sentence => ""
      )
    ])
  end

  it "renders a list of haiku_searches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
