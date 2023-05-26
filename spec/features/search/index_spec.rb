require 'rails_helper'

RSpec.describe 'search index' do


  it 'has fire nation members count', :vcr do
    visit "/search?nation=fire%2Bnation&commit=Search+For+Members"

    expect(page).to have_content("Total Characters: 97")
  end

  it 'lists 25 members', :vcr do
    visit "/search?nation=fire%2Bnation&commit=Search+For+Members"

    expect(page).to have_content("Name:", count: 25)
  end

  it 'has proper attributes', :vcr do
    visit "/search?nation=fire%2Bnation&commit=Search+For+Members"

    @character = SearchFacade.new({nation: "fire+nation"}).character_search[0]
    within "#character_#{@character[:_id]}" do
      expect(page).to have_content("Name: Chan (Fire Nation admiral)")
      expect(page).to have_content("Allies: Ozai")
      expect(page).to have_content("Enemies: Earth Kingdom")
      expect(page).to have_content("Affiliation: Fire Nation Navy")
    end
  end

  it 'has puts none when allies and enemies are empty', :vcr do
    visit "/search?nation=fire%2Bnation&commit=Search+For+Members"

    @character = SearchFacade.new({nation: "fire+nation"}).character_search[22]
    within "#character_#{@character[:_id]}" do
      expect(page).to have_content("Allies: None")
      expect(page).to have_content("Enemies: None")
    end
  end
end







