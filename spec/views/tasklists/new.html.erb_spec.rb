require 'spec_helper'

describe "tasklists/new" do
  before(:each) do
    assign(:tasklist, stub_model(Tasklist,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new tasklist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tasklists_path, "post" do
      assert_select "input#tasklist_title[name=?]", "tasklist[title]"
      assert_select "textarea#tasklist_description[name=?]", "tasklist[description]"
    end
  end
end
