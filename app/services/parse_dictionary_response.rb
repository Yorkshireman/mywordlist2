class ParseDictionaryResponse

  def self.call(hash)
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