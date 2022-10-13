defmodule Cyrelas.Champions.Class do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "classes" do
    field :name, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
  end
end
