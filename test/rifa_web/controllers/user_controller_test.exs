defmodule Rifa.UserControllerTest do
  use RifaWeb.ConnCase

  describe "Create/2" do
    test "Returns ok when valid data", %{conn: conn} do
      params = %{name: "John One", email: "john@gmail.com"}

      conn = post(conn, "/api/users", user: params)

      assert subject = json_response(conn, 201)["data"]
      assert subject["name"] == params.name
      assert subject["email"] == params.email
    end
  end
end
