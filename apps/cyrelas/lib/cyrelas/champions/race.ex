defmodule Cyrelas.Champions.Race do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "races" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(race, attrs) do
    race
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
