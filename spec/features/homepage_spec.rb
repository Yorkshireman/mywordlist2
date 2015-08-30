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

  context "when submitting a dictionary definition" do
    it "displays response on the page" do
      allow_any_instance_of(PagesController).to receive(:get_definition).with("word").and_return("response")
      allow_any_instance_of(PagesController).to receive(:parse_response).with("response").and_return(["response"])
      fill_in 'word', with: "word"
      click_button 'Define'
      expect(page).to have_content("response")
    end
  end
end