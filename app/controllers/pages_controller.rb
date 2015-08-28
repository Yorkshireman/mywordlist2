class PagesController < ApplicationController
  def home
    @wordlists = Wordlist.all
  end
end