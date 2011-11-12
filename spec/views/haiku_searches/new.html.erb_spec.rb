require 'spec_helper'

describe "haiku_searches/new.html.erb" do
  before(:each) do
    assign(:haiku_search, stub_model(HaikuSearch,
      :sentence => ""
    ).as_new_record)
  end

  it "renders new haiku_search form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => haiku_searches_path, :method => "post" do
      assert_select "input#haiku_search_sentence", :name => "haiku_search[sentence]"
    end
  end
end
