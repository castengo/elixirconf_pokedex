defmodule PokedexTest do
  use ExUnit.Case
  doctest Pokedex

  test "greets the world" do
    assert Pokedex.hello() == :world
  end
end
