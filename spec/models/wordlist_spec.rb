require 'rails_helper'

RSpec.describe Wordlist, type: :model do
  it 'has a title property' do
    wordlist = Wordlist.create(title: "title")
    expect(wordlist.title).to be_truthy
  end
end
