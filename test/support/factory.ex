defmodule Rifa.Factory do
  use ExMachina.Ecto, repo: Rifa.Repo

  use Rifa.UserFactory
  use Rifa.RaffleFactory
  use Rifa.UsersRafflesFactory
end
