defmodule Cyrelas.Champions.Character do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "characters" do
    field :archetype, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, [:name, :archetype])
    |> validate_required([:name, :archetype])
  end
end
