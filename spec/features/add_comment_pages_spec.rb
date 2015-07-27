require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment", js: true do
    visit blogs_path
    click_on 'Add A New Blog Entry'
    fill_in 'Title', :with => 'Title'
    click_on 'Create Blog'
    visit blog_path(1)
    click_on 'Add a comment'
    fill_in 'Comment', :with => 'Test'
    click_on 'Create Comment'
    expect(page).to have_content 'Test'
  end
end
