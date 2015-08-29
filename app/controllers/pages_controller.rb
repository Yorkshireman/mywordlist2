class PagesController < ApplicationController
  def home
    @wordlists = Wordlist.all
  end

  def get_definition
    word = params["word"]
    client = MWDictionaryAPI::Client.new('2a4dee74-e16f-4805-be47-0e41d7e8d840', api_type: "learners")
    result = client.search(word)
    puts result.to_hash
    redirect_to root_path
  end
end