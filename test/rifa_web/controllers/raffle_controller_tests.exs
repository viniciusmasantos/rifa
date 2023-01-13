defmodule RifaWeb.RaffleControllerTest do
  use RifaWeb.ConnCase

  import Rifa.AuthFixtures
  import Rifa.LotteryFixtures

  describe "create/2" do
    test "returns ok when valid data", %{conn: conn} do
      params = %{name: "João", date: "2022-12-12"}

      conn = post(conn, "/api/raffles", raffle: params)

      assert subject = json_response(conn, 201)["data"]
      assert subject["name"] == params.name
      assert subject["date"] == params.date

      # json_response(conn, 201) |> Access.get("data") só a segunda parte

      # if json_response(conn, 201) == map, when map["data"] not nil do
      #   subject = map["data"]
      # end
    end
  end

  describe "subscription/2" do
    test "returns ok when valid data", %{conn: conn} do
      user = user_fixture()
      raffle = raffle_fixture()
      params = %{user_id: user.id, raffle_id: raffle.id}

      conn = post(conn, "/api/raffles/subscription", params)

      assert  json_response(conn, 201)
    end
  end


end
