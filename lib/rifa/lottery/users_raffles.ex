defmodule Rifa.Lottery.UsersRaffles do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rifa.Auth.User
  alias Rifa.Lottery.Raffle

  @primary_key false
  schema "user_raffle" do
    belongs_to(:user, User)
    belongs_to(:raffle, Raffle)

    timestamps()
  end

  @required [:user_id, :raffle_id]

  @doc false
  def changeset(user_raffle, attrs) do
    user_raffle
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
