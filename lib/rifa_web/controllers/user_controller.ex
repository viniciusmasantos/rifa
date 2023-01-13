defmodule RifaWeb.UserController do
  use RifaWeb, :controller

  def create(conn, %{"user" => params}) do
    with {:ok, user} <- Rifa.Auth.create_user(params) do
      conn
      |> put_status(201)
      |> json(%{data: %{name: user.name, email: user.email}})
    end
  end
end
