require 'spec_helper'

describe "creating tasklists" do 
	it "redirects to the tasklist index page on success" do
	visit "/tasklists"
	click_link "New Tasklist"
	expect(page).to have_content("New Tasklist")

	fill_in "Title", with: "My Tasklist"
	fill_in "Description", with: "This is what I'm doing today"
	click_button "Create Tasklist"

	expect(page).to have_content("My Tasklist")
	end

it "displays an error when the tasklist has no title" do
	expect(Tasklist.count).to eq(0)

	visit "/tasklists"
	click_link "New Tasklist"
	expect(page).to have_content("New Tasklist")

	fill_in "Title", with: ""
	fill_in "Description", with: "This is what I'm doing today"
	click_button "Create Tasklist"

	expect(page).to have_content("error")
	expect(Tasklist.count).to eq(0)

	visit "/tasklists"
	expect(page).to_not have_content("This is what I'm doing today")
	end

it "displays an error when the tasklist has a title less than three characters" do
	expect(Tasklist.count).to eq(0)

	visit "/tasklists"
	click_link "New Tasklist"
	expect(page).to have_content("New Tasklist")

	fill_in "Title", with: "Hi"
	fill_in "Description", with: "This is what I'm doing today"
	click_button "Create Tasklist"

	expect(page).to have_content("error")
	expect(Tasklist.count).to eq(0)

	visit "/tasklists"
	expect(page).to_not have_content("This is what I'm doing today")
	end

end