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



end