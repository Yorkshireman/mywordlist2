class GetDefinition
  
  def self.call(word)
    client = MWDictionaryAPI::Client.new('2a4dee74-e16f-4805-be47-0e41d7e8d840', api_type: "learners")
    result = client.search(word)
    result.to_hash
  end

end