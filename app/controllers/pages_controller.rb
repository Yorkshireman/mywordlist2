class PagesController < ApplicationController
  def home
    @wordlists = Wordlist.all
  end

  def display_definition
    word = params["word"]
    definition_hash = get_definition(word)
    @definition = parse_response(definition_hash)
    @wordlists = Wordlist.all
    render 'home'
  end

  def get_definition word
    client = MWDictionaryAPI::Client.new('2a4dee74-e16f-4805-be47-0e41d7e8d840', api_type: "learners")
    result = client.search(word)
    return result.to_hash
  end

  def parse_response(hash)
    entries_array = []
    final_array = []

    hash[:entries].each do |entry|
      entries_array << entry
    end

    entries_array.each do |entry|
      final_array << "\"#{entry[:id_attribute]}\":\n"
      
      definition_number = 1
      entry[:definitions].each do |definition|
        unless (definition[:text].split("  ")).first == (definition[:text].split("  ")).last
          definition_array = definition[:text].split("  ")
          definition_array.first[0] = ''
          final_array << "#{definition_number}. #{definition_array.first} (#{definition_array.last.strip}).\n"
        else
          definition[:text][0] = ''
          final_array << "#{definition_number}. #{definition[:text]}.\n"
        end
        definition_number += 1
      end
      final_array << "\n"
    end
    final_array
  end
end