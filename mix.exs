defmodule Pokedex.MixProject do
  use Mix.Project

  def project do
    [
      app: :pokedex,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Pokedex.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # 1. add pokemon proto to dependencies to get all proto definitions and grpc stuff
      {:pokemon_proto, github: "castengo/elixirconf_pokemon_proto"}
    ]
  end
end
