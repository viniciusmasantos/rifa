defmodule Rifa.Repo.Migrations.CreateRaffles do
  use Ecto.Migration

  def change do
    create table(:raffles) do
      add :name, :string
      add :date, :date

      timestamps()
    end


  end
end
