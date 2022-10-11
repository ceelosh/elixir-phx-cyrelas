defmodule CyrelasWeb.CharacterController do
  use CyrelasWeb, :controller

  alias Cyrelas.Champions
  alias Cyrelas.Champions.Character

  action_fallback CyrelasWeb.FallbackController

  def index(conn, _params) do
    characters = Champions.list_characters()
    render(conn, "index.json", characters: characters)
  end

  def create(conn, %{"character" => character_params}) do
    with {:ok, %Character{} = character} <- Champions.create_character(character_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.character_path(conn, :show, character))
      |> render("show.json", character: character)
    end
  end

  def show(conn, %{"id" => id}) do
    character = Champions.get_character!(id)
    render(conn, "show.json", character: character)
  end

  def update(conn, %{"id" => id, "character" => character_params}) do
    character = Champions.get_character!(id)

    with {:ok, %Character{} = character} <- Champions.update_character(character, character_params) do
      render(conn, "show.json", character: character)
    end
  end

  def delete(conn, %{"id" => id}) do
    character = Champions.get_character!(id)

    with {:ok, %Character{}} <- Champions.delete_character(character) do
      send_resp(conn, :no_content, "")
    end
  end
end
