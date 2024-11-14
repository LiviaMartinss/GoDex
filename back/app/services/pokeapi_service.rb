# frozen_string_literal: true

class PokeapiService
  include HTTParty

  # Definimos a URL base com a configuração no Rails
  base_uri Rails.application.config.pokeapi_url

  def self.get_pokemon_info(pokemon_name)
    # Faz a requisição à API com o nome do Pokémon
    response = get("/#{pokemon_name.downcase}")

    # Retorna `nil` se a resposta não for um sucesso
    return nil unless response.success?

    # Processa os dados do Pokémon
    pokemon_data = JSON.parse(response.body)
    abilities = pokemon_data['abilities'].map do |ability|
      ability['ability']['name']
    end.sort

    sprite = pokemon_data['sprites']['front_default']

    # Retorna as informações estruturadas
    { name: pokemon_name.capitalize, abilities: abilities, sprite: sprite }
  end
end
