require 'spec_helper'

describe "Adding tasklist items" do 
let!(:tasklist) { Tasklist.create(title: "Grocery List", description: "My Grocery List") }

	def visit_tasklist(list)
		visit "/tasklists"
		within "#tasklist_#{list.id}" do
			click_link "List Items"
		end
	end

it "is successful with valid content" do
	visit_tasklist(tasklist)
	click_link "New Tasklist Item"
	fill_in "Content", with: "Milk"
	click_button "Save"
	expect(page).to have_content("Added tasklist item.")
	within("ul.tasklist_items") do
		expect(page).to have_content("Milk")
	end
end

it "displays an error with no content" do
	visit_tasklist(tasklist)
	click_link "New Tasklist Item"
	fill_in "Content", with: ""
	click_button "Save"
	within("div.flash") do
		expect(page).to have_content("There was a problem adding that tasklist item.")
	end
	expect(page).to have_content("Content can't be blank")
end

it "displays an error with content less than 2 characters long" do
	visit_tasklist(tasklist)
	click_link "New Tasklist Item"
	fill_in "Content", with: "1"
	click_button "Save"
	within("div.flash") do
		expect(page).to have_content("There was a problem adding that tasklist item.")
	end
	expect(page).to have_content("Content is too short")
end



end