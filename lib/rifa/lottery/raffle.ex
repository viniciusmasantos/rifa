defmodule Rifa.Lottery.Raffle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "raffles" do
    field :date, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(raffle, attrs) do
    raffle
    |> cast(attrs, [:name, :date])
    |> validate_required([:name, :date])
  end
end
