require 'spec_helper'

describe "tweets/show.html.erb" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet))
  end

  it "renders attributes in <p>" do
    render
  end
end
