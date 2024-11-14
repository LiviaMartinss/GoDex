# frozen_string_literal: true

module Api
  module V2
    class PokemonsController < ApplicationController
      def show
        if pokemon_info
          render json: pokemon_info
        else
          render json: { error: 'Pokémon not found' }, status: :not_found
        end
      end

      private

      def pokemon_name
        params[:pokemon_name]
      end

      def pokemon_info
        # Aqui estamos chamando o serviço externo para obter as informações do Pokémon
        @pokemon_info ||= PokeapiService.get_pokemon_info(pokemon_name)
      end
    end
  end
end
