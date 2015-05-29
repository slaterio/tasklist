require 'spec_helper'

describe "tasklists/index" do
  before(:each) do
    assign(:tasklists, [
      stub_model(Tasklist,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Tasklist,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of tasklists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
