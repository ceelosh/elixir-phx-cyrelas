defmodule CyrelasWeb.CharacterControllerTest do
  use CyrelasWeb.ConnCase

  import Cyrelas.ChampionsFixtures

  @create_attrs %{archetype: "some archetype", attack_points: 42, defense_points: 42, energy_points: 42, life_points: 42, name: "some name"}
  @update_attrs %{archetype: "some updated archetype", attack_points: 43, defense_points: 43, energy_points: 43, life_points: 43, name: "some updated name"}
  @invalid_attrs %{archetype: nil, attack_points: nil, defense_points: nil, energy_points: nil, life_points: nil, name: nil}

  describe "index" do
    test "lists all character", %{conn: conn} do
      conn = get(conn, Routes.character_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Character"
    end
  end

  describe "new character" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.character_path(conn, :new))
      assert html_response(conn, 200) =~ "New Character"
    end
  end

  describe "create character" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.character_path(conn, :create), character: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.character_path(conn, :show, id)

      conn = get(conn, Routes.character_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Character"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.character_path(conn, :create), character: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Character"
    end
  end

  describe "edit character" do
    setup [:create_character]

    test "renders form for editing chosen character", %{conn: conn, character: character} do
      conn = get(conn, Routes.character_path(conn, :edit, character))
      assert html_response(conn, 200) =~ "Edit Character"
    end
  end

  describe "update character" do
    setup [:create_character]

    test "redirects when data is valid", %{conn: conn, character: character} do
      conn = put(conn, Routes.character_path(conn, :update, character), character: @update_attrs)
      assert redirected_to(conn) == Routes.character_path(conn, :show, character)

      conn = get(conn, Routes.character_path(conn, :show, character))
      assert html_response(conn, 200) =~ "some updated archetype"
    end

    test "renders errors when data is invalid", %{conn: conn, character: character} do
      conn = put(conn, Routes.character_path(conn, :update, character), character: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Character"
    end
  end

  describe "delete character" do
    setup [:create_character]

    test "deletes chosen character", %{conn: conn, character: character} do
      conn = delete(conn, Routes.character_path(conn, :delete, character))
      assert redirected_to(conn) == Routes.character_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.character_path(conn, :show, character))
      end
    end
  end

  defp create_character(_) do
    character = character_fixture()
    %{character: character}
  end
end
