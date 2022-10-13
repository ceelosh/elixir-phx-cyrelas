defmodule Cyrelas.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :archetype, :string

      timestamps()
    end
  end
end
