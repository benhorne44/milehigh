require 'spec_helper'


describe "review section" do
  it "appears" do
    store = FactoryGirl.create(:store)
    visit home_path
    expect(page).to have_content("Review a store")
  end

  it "can create a new positive review" do

    store = FactoryGirl.create(:store)
    store2 = FactoryGirl.create(:store, name: "snoop's house")
    FactoryGirl.create(:review)
    FactoryGirl.create(:review)
    FactoryGirl.create(:review)

    visit home_path
    select("snoop's house", :from => "Store")
    fill_in('Title', :with => 'awwwwwwwwesohm')
    fill_in('Body', :with => 'truuuuuly delish nug')
    find('#thumbs-up').click
    expect(page).to have_content("Your review of #{store2.name} was created.")
    within('#review-feed') do
      # Add user name and validation
      expect(page).to have_content('awwwwwwwwesohm')
      expect(page).to have_content('truuuuuly delish nug')
    end
  end

  it "can create a new negative review" do

    store = FactoryGirl.create(:store)
    store2 = FactoryGirl.create(:store, name: "snoop's house")
    FactoryGirl.create(:review)
    FactoryGirl.create(:review)
    FactoryGirl.create(:review)

    visit home_path
    select("snoop's house", :from => "Store")
    fill_in('Title', :with => 'hoooorrible')
    fill_in('Body', :with => 'truuuuuly horrible nug')
    find('#thumbs-down').click
    expect(page).to have_content("Your review of #{store2.name} was created.")
    within('#review-feed') do
      # Add user name and validation
      expect(page).to have_content('hoooorrible')
      expect(page).to have_content('truuuuuly horrible nug')
    end
  end
end