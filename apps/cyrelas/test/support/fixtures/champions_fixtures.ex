defmodule Cyrelas.ChampionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cyrelas.Champions` context.
  """

  @doc """
  Generate a character.
  """
  def character_fixture(attrs \\ %{}) do
    {:ok, character} =
      attrs
      |> Enum.into(%{
        archetype: "some archetype",
        name: "some name"
      })
      |> Cyrelas.Champions.create_character()

    character
  end

  @doc """
  Generate a class.
  """
  def class_fixture(attrs \\ %{}) do
    {:ok, class} =
      attrs
      |> Enum.into(%{
        name: "some name",
        type: "some type"
      })
      |> Cyrelas.Champions.create_class()

    class
  end

  @doc """
  Generate a race.
  """
  def race_fixture(attrs \\ %{}) do
    {:ok, race} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Cyrelas.Champions.create_race()

    race
  end
end
