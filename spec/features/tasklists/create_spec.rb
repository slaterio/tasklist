require 'spec_helper'

describe "creating tasklists" do 

	def create_tasklist(options={})
		options[:title] ||= "My Tasklist"
		options[:description] ||= "this is my tasklist"

		visit "/tasklists"
		click_link "New Tasklist"
		expect(page).to have_content("New Tasklist")

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Create Tasklist"
	end

	it "redirects to the tasklist index page on success" do
		create_tasklist
		expect(page).to have_content("My Tasklist")
	end

it "displays an error when the tasklist has no title" do
	expect(Tasklist.count).to eq(0)

	create_tasklist title: ""

	expect(page).to have_content("error")
	expect(Tasklist.count).to eq(0)

	visit "/tasklists"
	expect(page).to_not have_content("This is what I'm doing today")
	end

it "displays an error when the tasklist has a title less than three characters" do
	expect(Tasklist.count).to eq(0)

	create_tasklist title: "Hi"

	expect(page).to have_content("error")
	expect(Tasklist.count).to eq(0)

	visit "/tasklists"
	expect(page).to_not have_content("This is what I'm doing today")
	end

it "displays an error when the tasklist has no description" do
	expect(Tasklist.count).to eq(0)

	create_tasklist title: "My Shopping List", description: ""

	expect(page).to have_content("error")
	expect(Tasklist.count).to eq(0)

	visit "/tasklists"
	expect(page).to_not have_content("My Shopping List")
	end

it "displays an error when the tasklist has a description less than three characters" do
	expect(Tasklist.count).to eq(0)

	create_tasklist title: "My Shopping List", description: "No"

	expect(page).to have_content("error")
	expect(Tasklist.count).to eq(0)

	visit "/tasklists"
	expect(page).to_not have_content("My Shopping List")
	end

end