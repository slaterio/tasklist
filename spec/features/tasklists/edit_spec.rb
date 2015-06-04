require 'spec_helper'

describe "editing tasklists" do 

it "edits a tasklist successfully with correct information" do

	tasklist = Tasklist.create(title: "Groceries", description: "Grocery list.")

	visit "/tasklists"
	within "#tasklist_#{tasklist.id}" do
		click_link "Edit"
	end

	fill_in "Title", with: "New Title"
	fill_in "Description", with: "New Description"
	click_button "Update Tasklist"

	tasklist.reload

	expect(page).to have_content("Tasklist was successfully updated")
	expect(tasklist.title).to eq("New Title")
	expect(tasklist.description).to eq("New Description")


end

end