require 'rails_helper'

RSpec.describe "Home Page" do
  before :each do
    @wordlist1 = create :wordlist
    @wordlist2 = create :wordlist
    @wordlist3 = create :wordlist
    visit('/')
  end

  it "has 'Hello, World!' displayed" do
    expect(page).to have_content("Hello, World!")
  end

  it "shows a bunch of wordlists" do
    expect(page).to have_content("#{@wordlist1.title}")
    expect(page).to have_content("#{@wordlist2.title}")
    expect(page).to have_content("#{@wordlist3.title}")
  end
end