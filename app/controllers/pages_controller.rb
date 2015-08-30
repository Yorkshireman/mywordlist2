class PagesController < ApplicationController
  def home
    @wordlists = Wordlist.all
  end

  def display_definition
    word = params["word"]
    definition_hash = get_definition(word)
    @definition = ParseDictionaryResponse.call(definition_hash)
    @wordlists = Wordlist.all
    render 'home'
  end

  def get_definition word
    client = MWDictionaryAPI::Client.new('2a4dee74-e16f-4805-be47-0e41d7e8d840', api_type: "learners")
    result = client.search(word)
    return result.to_hash
  end
end