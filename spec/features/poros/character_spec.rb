require 'rails_helper'

RSpec.describe Character do
  it 'exists', :vcr do
    attrs = {
      name: 'Joe',
      _id: 1,
      photoUrl: nil,
      allies: 'US of A',
      enemies: 'Gosh Darn Bad Guys',
      affiliation: 'United States Armed Citizen',
    }

    character = Character.new(attrs)
    
    expect(character).to be_a Character
    expect(character.name).to eq('Joe')
    expect(character.id).to eq(1)
    expect(character.photo).to eq(nil)
    expect(character.allies).to eq('US of A')
    expect(character.enemies).to eq('Gosh Darn Bad Guys')
    expect(character.affiliation).to eq("United States Armed Citizen")
  end
end