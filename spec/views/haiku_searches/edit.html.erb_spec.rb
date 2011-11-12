require 'spec_helper'

describe "haiku_searches/edit.html.erb" do
  before(:each) do
    @haiku_search = assign(:haiku_search, stub_model(HaikuSearch,
      :sentence => ""
    ))
  end

  it "renders the edit haiku_search form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => haiku_searches_path(@haiku_search), :method => "post" do
      assert_select "input#haiku_search_sentence", :name => "haiku_search[sentence]"
    end
  end
end
