require 'spec_helper'

describe "deleting tasklists" do 

	let!(:tasklist) { Tasklist.create(title: "Groceries", description: "Grocery list.") }

	it "is successful when clicking destroy link" do

	visit "/tasklists"
	within "#tasklist_#{tasklist.id}" do
		click_link "Destroy"
		end

		expect(page).to_not have_content(tasklist.title)
		expect(Tasklist.count).to eq(0)

	end

end