require 'spec_helper'

describe "tasklists/edit" do
  before(:each) do
    @tasklist = assign(:tasklist, stub_model(Tasklist,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit tasklist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tasklist_path(@tasklist), "post" do
      assert_select "input#tasklist_title[name=?]", "tasklist[title]"
      assert_select "textarea#tasklist_description[name=?]", "tasklist[description]"
    end
  end
end
