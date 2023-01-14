defmodule Rifa.LotteryTest do
  use Rifa.DataCase

  alias Rifa.Lottery

  describe "raffles" do
    alias Rifa.Lottery.Raffle

    import Rifa.LotteryFixtures

    @invalid_attrs %{date: nil, name: nil}

    test "list_raffles/0 returns all raffles" do
      raffle = raffle_fixture()
      assert Lottery.list_raffles() == [raffle]
    end

    test "get_raffle!/1 returns the raffle with given id" do
      raffle = raffle_fixture()
      assert Lottery.get_raffle!(raffle.id) == raffle
    end

    test "create_raffle/1 with valid data creates a raffle" do
      valid_attrs = %{date: "2000-10-10", name: "some name"}

      assert {:ok, %Raffle{} = raffle} = Lottery.create_raffle(valid_attrs)
      assert raffle.date ==  ~D[2000-10-10]
      assert raffle.name == "some name"
    end

    test "create_raffle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lottery.create_raffle(@invalid_attrs)
    end

    test "update_raffle/2 with valid data updates the raffle" do
      raffle = raffle_fixture()
      update_attrs = %{date: "2000-10-10", name: "some updated name"}

      assert {:ok, %Raffle{} = raffle} = Lottery.update_raffle(raffle, update_attrs)
      assert raffle.date ==  ~D[2000-10-10]
      assert raffle.name == "some updated name"
    end

    test "update_raffle/2 with invalid data returns error changeset" do
      raffle = raffle_fixture()
      assert {:error, %Ecto.Changeset{}} = Lottery.update_raffle(raffle, @invalid_attrs)
      assert raffle == Lottery.get_raffle!(raffle.id)
    end

    test "delete_raffle/1 deletes the raffle" do
      raffle = raffle_fixture()
      assert {:ok, %Raffle{}} = Lottery.delete_raffle(raffle)
      assert_raise Ecto.NoResultsError, fn -> Lottery.get_raffle!(raffle.id) end
    end

    test "change_raffle/1 returns a raffle changeset" do
      raffle = raffle_fixture()
      assert %Ecto.Changeset{} = Lottery.change_raffle(raffle)
    end
  end
end
