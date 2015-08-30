class DefinitionsController < ApplicationController

  def new
    word = params["word"]
    definition_hash = GetDefinition.call(word)
    @definition = ParseDictionaryResponse.call(definition_hash)
    @wordlists = Wordlist.all
    render 'pages/home'
  end
  
end