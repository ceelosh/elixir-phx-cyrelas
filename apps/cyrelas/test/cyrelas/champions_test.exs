defmodule Cyrelas.ChampionsTest do
  use Cyrelas.DataCase

  alias Cyrelas.Champions

  describe "characters" do
    alias Cyrelas.Champions.Character

    import Cyrelas.ChampionsFixtures

    @invalid_attrs %{archetype: nil, name: nil}

    test "list_characters/0 returns all characters" do
      character = character_fixture()
      assert Champions.list_characters() == [character]
    end

    test "get_character!/1 returns the character with given id" do
      character = character_fixture()
      assert Champions.get_character!(character.id) == character
    end

    test "create_character/1 with valid data creates a character" do
      valid_attrs = %{archetype: "some archetype", name: "some name"}

      assert {:ok, %Character{} = character} = Champions.create_character(valid_attrs)
      assert character.archetype == "some archetype"
      assert character.name == "some name"
    end

    test "create_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Champions.create_character(@invalid_attrs)
    end

    test "update_character/2 with valid data updates the character" do
      character = character_fixture()
      update_attrs = %{archetype: "some updated archetype", name: "some updated name"}

      assert {:ok, %Character{} = character} = Champions.update_character(character, update_attrs)
      assert character.archetype == "some updated archetype"
      assert character.name == "some updated name"
    end

    test "update_character/2 with invalid data returns error changeset" do
      character = character_fixture()
      assert {:error, %Ecto.Changeset{}} = Champions.update_character(character, @invalid_attrs)
      assert character == Champions.get_character!(character.id)
    end

    test "delete_character/1 deletes the character" do
      character = character_fixture()
      assert {:ok, %Character{}} = Champions.delete_character(character)
      assert_raise Ecto.NoResultsError, fn -> Champions.get_character!(character.id) end
    end

    test "change_character/1 returns a character changeset" do
      character = character_fixture()
      assert %Ecto.Changeset{} = Champions.change_character(character)
    end
  end

  describe "classes" do
    alias Cyrelas.Champions.Class

    import Cyrelas.ChampionsFixtures

    @invalid_attrs %{name: nil, type: nil}

    test "list_classes/0 returns all classes" do
      class = class_fixture()
      assert Champions.list_classes() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert Champions.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      valid_attrs = %{name: "some name", type: "some type"}

      assert {:ok, %Class{} = class} = Champions.create_class(valid_attrs)
      assert class.name == "some name"
      assert class.type == "some type"
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Champions.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      update_attrs = %{name: "some updated name", type: "some updated type"}

      assert {:ok, %Class{} = class} = Champions.update_class(class, update_attrs)
      assert class.name == "some updated name"
      assert class.type == "some updated type"
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = Champions.update_class(class, @invalid_attrs)
      assert class == Champions.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = Champions.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> Champions.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = Champions.change_class(class)
    end
  end

  describe "races" do
    alias Cyrelas.Champions.Race

    import Cyrelas.ChampionsFixtures

    @invalid_attrs %{name: nil}

    test "list_races/0 returns all races" do
      race = race_fixture()
      assert Champions.list_races() == [race]
    end

    test "get_race!/1 returns the race with given id" do
      race = race_fixture()
      assert Champions.get_race!(race.id) == race
    end

    test "create_race/1 with valid data creates a race" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Race{} = race} = Champions.create_race(valid_attrs)
      assert race.name == "some name"
    end

    test "create_race/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Champions.create_race(@invalid_attrs)
    end

    test "update_race/2 with valid data updates the race" do
      race = race_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Race{} = race} = Champions.update_race(race, update_attrs)
      assert race.name == "some updated name"
    end

    test "update_race/2 with invalid data returns error changeset" do
      race = race_fixture()
      assert {:error, %Ecto.Changeset{}} = Champions.update_race(race, @invalid_attrs)
      assert race == Champions.get_race!(race.id)
    end

    test "delete_race/1 deletes the race" do
      race = race_fixture()
      assert {:ok, %Race{}} = Champions.delete_race(race)
      assert_raise Ecto.NoResultsError, fn -> Champions.get_race!(race.id) end
    end

    test "change_race/1 returns a race changeset" do
      race = race_fixture()
      assert %Ecto.Changeset{} = Champions.change_race(race)
    end
  end
end
