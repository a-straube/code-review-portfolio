require 'rails_helper'

describe "the add a skill process" do
  it "adds a new skill" do
    visit skills_path
    click_on 'Add A Coding Skill'
    fill_in 'Name', :with => 'Ruby'
    click_on 'Create Skill'
    expect(page).to have_content 'Coding skill successfully added!'
  end
end
