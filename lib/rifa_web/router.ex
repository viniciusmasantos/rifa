defmodule RifaWeb.Router do
  use RifaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RifaWeb do
    pipe_through :api

    post "/users", UserController, :create
    post "/raffles", RaffleController, :create
    post "/raffles/subscription", RaffleController, :subscription
    get "/raffles/:id", RaffleController, :show
  end
end
