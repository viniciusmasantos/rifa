defmodule RifaWeb.RaffleController do
  use RifaWeb, :controller

  def create(conn, %{"raffle" => params}) do
    with {:ok, raffle} <- Rifa.Lottery.create_raffle(params) do
      conn
      |> put_status(201)
      |> json(%{data: %{name: raffle.name, date: raffle.date}})
    end
  end


  def show(conn, %{"id" => id}) do
    with {:ok, _raffle} <- Payfy4.Lottery.get_raffle(id) do
      json(conn, "unfinished raffle")
    else
      _ -> put_status(conn, 400) |> json("")
    end
  end
end
