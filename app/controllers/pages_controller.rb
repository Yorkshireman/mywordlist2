class PagesController < ApplicationController
  def home
    @wordlists = Wordlist.all
  end

  def display_definition
    word = params["word"]
    definition_hash = GetDefinition.call(word)
    @definition = ParseDictionaryResponse.call(definition_hash)
    @wordlists = Wordlist.all
    render 'home'
  end
end