defmodule Cyrelas.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :type, :string

      timestamps()
    end
  end
end
