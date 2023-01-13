defmodule RifaWeb.RaffleController do
  use RifaWeb, :controller

  def create(conn, %{"raffle" => params}) do
    with {:ok, raffle} <- Rifa.Lottery.create_raffle(params) do
      conn
      |> put_status(201)
      |> json(%{data: %{name: raffle.name, date: raffle.date}})
    end
  end

  # def subscription(conn, params) do
  #   with user <- Rifa.Auth.get_user!(params["user_id"]),
  #     raffle <- Rifa.Lottery.get_raffle!(params["raffle_id"]),
  #     {:ok, _s} <- Rifa.Lottery.add_user_to_raffle(%{user_id: user.id, raffle_id: raffle.id}) do
  #     conn
  #     |> json("ok")
  #   end
  # end
end
