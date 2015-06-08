require 'spec_helper'

describe "editing tasklists" do 

	let!(:tasklist) { Tasklist.create(title: "Groceries", description: "Grocery list.") }

		def update_tasklist(options={})
			options[:title] ||= "My Tasklist"
			options[:description] ||= "this is my tasklist"

			tasklist = options[:tasklist]

			visit "/tasklists"
			within "#tasklist_#{tasklist.id}" do
			click_link "Edit"
			end

			fill_in "Title", with: options[:title]
			fill_in "Description", with: options[:description]
			click_button "Update Tasklist"

		end

it "edits a tasklist successfully with correct information" do
	update_tasklist tasklist: tasklist, title: "New Title", description: "New Description"

	tasklist.reload

	expect(page).to have_content("Tasklist was successfully updated")
	expect(tasklist.title).to eq("New Title")
	expect(tasklist.description).to eq("New Description")

	end


it "displays an error when the tasklist has no title" do
	update_tasklist tasklist: tasklist, title: ""
	title = tasklist.title
	tasklist.reload
	expect(tasklist.title).to eq(title)	
	expect(page).to have_content("error")
	end

it "displays an error with too short a title" do
	update_tasklist tasklist: tasklist, title: "Hi"
	expect(page).to have_content("error")
	end

it "displays an error with no description" do
	update_tasklist tasklist: tasklist, description: ""
	expect(page).to have_content("error")
	end

it "displays an error with to short a description" do
	update_tasklist tasklist: tasklist, description: "Hi"
	expect(page).to have_content("error")
	end

end