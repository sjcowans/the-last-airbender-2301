class CharacterService
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://last-airbender-api.fly.dev')
  end

  def self.fire_nation_characters
    get_url('/api/v1/characters?perPage=500&page=1&affiliation=Fire+Nation')
  end
end