require 'spec_helper'

describe "Editing tasklist items" do 
let!(:tasklist) { Tasklist.create(title: "Grocery List", description: "My Grocery List") }
let!(:tasklist_item) { tasklist.tasklist_items.create(content: "Milk") }

	def visit_tasklist(list)
		visit "/tasklists"
		within "#tasklist_#{list.id}" do
			click_link "List Items"
		end
	end

	it "is successful with valid content" do
		visit_tasklist(tasklist)
		within("#tasklist_item_#{tasklist_item.id}") do
			click_link "Edit"
		end
		fill_in "Content", with: "Lots of Milk"
		click_button "Save"
		expect(page).to have_content("Saved tasklist item.")
		tasklist_item.reload
		expect(tasklist_item.content).to eq("Lots of Milk")
	end

end