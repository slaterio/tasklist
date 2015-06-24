require 'spec_helper'

describe "Viewing tasklist items" do 
let!(:tasklist) { Tasklist.create(title: "Grocery List", description: "My Grocery List") }

	def visit_tasklist(list)
		visit "/tasklists"
		within "#tasklist_#{list.id}" do
			click_link "List Items"
		end
	end

	it "displays the title of the tasklist" do
		visit_tasklist(tasklist)
		within("h1") do
			expect(page).to have_content(tasklist.title)
		end
	end

	it "displays no items when tasklist is empty" do
			visit_tasklist(tasklist)
			expect(page.all("ul.tasklist_items li").size).to eq(0)
		end

	it "displays item content when a tasklist has items" do
		tasklist.tasklist_items.create(content: "Milk")
		tasklist.tasklist_items.create(content: "Eggs")
		
		visit_tasklist(tasklist)
		
		expect(page.all("ul.tasklist_items li").size).to eq(2)
		
		within "ul.tasklist_items" do
			expect(page).to have_content("Milk")
			expect(page).to have_content("Eggs")
		end
	end


end