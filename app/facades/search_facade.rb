class SearchFacade
  def initialize(params)
    @nation = params[:nation]
  end

  def character_search
    if @nation == "fire+nation"
      fire_nation_search
    end
  end

  def fire_nation_search
    characters = CharacterService.fire_nation_characters
    characters.each do |character|
      Character.new(character)
    end
  end
end

