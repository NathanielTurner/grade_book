require 'rails_helper'
include Capybara::DSL

RSpec.describe "running the model", :type => :request do
  it "creates teacher" do
    visit '/teachers/new'
    fill_in "Name", :with => "John Doe"
    fill_in "Email", :with => "jdoe@example.com"
    fill_in "Password", :with => "secret"
    fill_in "Password confirmation", :with => "secret"
    click_button "Create Teacher"
    expect(page).to have_content 'Teacher was successfully created.'
  end

  it "logs teacher in" do
    visit '/login'
    fill_in "Email", :with => "jdoe@example.com"
    fill_in "Password", :with => "secret"
    click_button "Login"
    expect(page).to have_content "Login successful."
  end

  it "logs teachers out" do
  end

end
