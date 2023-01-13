defmodule RifaWeb.RaffleControllerTest do
  use RifaWeb.ConnCase

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



end
