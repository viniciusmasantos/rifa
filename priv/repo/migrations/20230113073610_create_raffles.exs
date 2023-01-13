defmodule Rifa.Repo.Migrations.CreateRaffles do
  use Ecto.Migration

  def change do
    create table(:raffles) do
      add :name, :string
      add :date, :string

      timestamps()
    end
  end
end
