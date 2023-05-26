class Character
  attr_reader :name,
              :allies,
              :photo,
              :id,
              :affiliation,
              :enemies

  def initialize(info)
    @id = info[:_id]
    @allies = info[:allies]
    @enemies = info[:enemies]
    @photo = info[:photoUrl]
    @name = info[:name]
    @affiliation = info[:affiliation]
  end
end