#  2. setup pokemon client to talk to pokemon repo app
defmodule Pokedex.Client do
  # 3. alias stub that we use to communicate
  alias Pokeapi.PokemonService.Stub

  # 5. alias proto generated modules that were going to use
  alias Pokeapi.{
    GetPokemonRequest,
    GetPokemonResponse,
    Pokemon
  }

  # 4. setup url of pokemon repo
  @pokemon_repo_url "localhost:8080"

  @spec get_pokemon(String.t()) :: {:ok, Pokemon.t()} | {:error, any}
  def get_pokemon(name) do
    # 6. Establish a connection with gRPC server and return GRPC.Channel needed for sending requests.
    with {:ok, channel} <- GRPC.Stub.connect(@pokemon_repo_url),
         # 7. build request struct
         {:ok, %GetPokemonRequest{} = request} <- build_request(name),
         # 8. call rpc method in remote server by passing channel and request parameter
         # you can also pass options for timeout and deadline
         {:ok, %GetPokemonResponse{pokemon: pokemon}} <-
           Stub.get_pokemon(channel, request) do
      {:ok, pokemon}
    end
  end

  defp build_request(name), do: {:ok, GetPokemonRequest.new(name: name)}
end
