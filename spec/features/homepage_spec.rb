require 'rails_helper'

RSpec.describe "Home Page" do
  it "has 'Hello, World!' displayed" do
    visit('/')
    expect(page).to have_content("Hello, World!")
  end
end