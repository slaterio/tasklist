require 'spec_helper'

describe "Viewing tasklist items" do 
let!(:tasklist) { Tasklist.create(title: "Grocery List", description: "My Grocery List") }
it "displays no items when tasklist is empty" do
	visit "/tasklists"
	within "#tasklist_#{tasklist.id}" do
	click_link "List Items"
end
expect(page).to have_content("TasklistItems#index")
end


end