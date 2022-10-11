defmodule CyrelasWeb.CharacterControllerTest do
  use CyrelasWeb.ConnCase

  import Cyrelas.ChampionsFixtures

  alias Cyrelas.Champions.Character

  @create_attrs %{
    archetype: "some archetype",
    name: "some name"
  }
  @update_attrs %{
    archetype: "some updated archetype",
    name: "some updated name"
  }
  @invalid_attrs %{archetype: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all characters", %{conn: conn} do
      conn = get(conn, Routes.character_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create character" do
    test "renders character when data is valid", %{conn: conn} do
      conn = post(conn, Routes.character_path(conn, :create), character: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.character_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "archetype" => "some archetype",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.character_path(conn, :create), character: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update character" do
    setup [:create_character]

    test "renders character when data is valid", %{conn: conn, character: %Character{id: id} = character} do
      conn = put(conn, Routes.character_path(conn, :update, character), character: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.character_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "archetype" => "some updated archetype",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, character: character} do
      conn = put(conn, Routes.character_path(conn, :update, character), character: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete character" do
    setup [:create_character]

    test "deletes chosen character", %{conn: conn, character: character} do
      conn = delete(conn, Routes.character_path(conn, :delete, character))
      assert response(conn, 204)

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
