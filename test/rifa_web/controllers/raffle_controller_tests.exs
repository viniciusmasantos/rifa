defmodule RifaWeb.RaffleControllerTest do
  use RifaWeb.ConnCase

  #import Rifa.AuthFixtures
  #import Rifa.LotteryFixtures
  import Rifa.Factory

  describe "create/2" do
    test "returns ok when valid data", %{conn: conn} do
      params = %{name: "João", date: "2022-12-12"}

      conn = post(conn, "/api/raffles", raffle: params)

      assert subject = json_response(conn, 201)["data"]
      assert subject["name"] == params.name
      assert subject["date"] == params.date
    end
  end

  describe "subscription/2" do
    test "returns ok when valid data", %{conn: conn} do
      user = insert(:user)
      raffle = insert(:raffle)
      params = %{user_id: user.id, raffle_id: raffle.id}

      conn = post(conn, "/api/raffles/subscription", params)

      assert  json_response(conn, 201)
    end
  end

  describe "show/2" do
    test "returns ok when valid data", %{conn: conn} do
      raffle = insert(:raffle)
      user = insert(:user)
      insert(:users_raffles, %{user: user, raffle: raffle})
      unlucked = insert(:user)

      conn = get(conn, "/api/raffles/#{raffle.id}")

      assert subject = json_response(conn, 200)["data"]
      assert subject["id"] == user.id
      refute subject["id"] == unlucked.id
    end

    test "returns msg when raffle unfinished", %{conn: conn} do
      raffle = insert(:raffle)

      conn = get(conn, "/api/raffles/#{raffle.id}")

      assert json_response(conn, 200) == "unfinished raffle"
    end

    test "returns error when invalid data", %{conn: conn} do
      conn = get(conn, "/api/raffles/0")

      assert response(conn, 400)
    end
  end

end
