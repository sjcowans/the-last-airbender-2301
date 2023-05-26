require 'rails_helper'

describe CharacterService do
  context 'class methods' do
    it 'returns character data', :vcr do
      search = CharacterService.fire_nation_characters
      expect(search).to be_an Array
      expect(search.count).to eq(97)
      character_data = search[3]

      expect(character_data).to have_key :_id
      expect(character_data[:_id]).to be_a(String)

      expect(character_data).to have_key :name
      expect(character_data[:name]).to be_a(String)

      expect(character_data).to have_key :enemies
      expect(character_data[:enemies]).to be_an(Array)

      expect(character_data).to have_key :allies
      expect(character_data[:allies]).to be_an(Array)

      expect(character_data).to have_key :affiliation
      expect(character_data[:affiliation]).to be_a(String)

      expect(character_data).to have_key :photoUrl
      expect(character_data[:photoUrl]).to be_a(String)
    end
  end
end