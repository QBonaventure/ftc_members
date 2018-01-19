defmodule FtcMembers.GameTest do
  use FtcMembers.DataCase

  alias FtcMembers.Game

  describe "heroes" do
    alias FtcMembers.Game.Heroes

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def heroes_fixture(attrs \\ %{}) do
      {:ok, heroes} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_heroes()

      heroes
    end

    test "list_heroes/0 returns all heroes" do
      heroes = heroes_fixture()
      assert Game.list_heroes() == [heroes]
    end

    test "get_heroes!/1 returns the heroes with given id" do
      heroes = heroes_fixture()
      assert Game.get_heroes!(heroes.id) == heroes
    end

    test "create_heroes/1 with valid data creates a heroes" do
      assert {:ok, %Heroes{} = heroes} = Game.create_heroes(@valid_attrs)
      assert heroes.name == "some name"
    end

    test "create_heroes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_heroes(@invalid_attrs)
    end

    test "update_heroes/2 with valid data updates the heroes" do
      heroes = heroes_fixture()
      assert {:ok, heroes} = Game.update_heroes(heroes, @update_attrs)
      assert %Heroes{} = heroes
      assert heroes.name == "some updated name"
    end

    test "update_heroes/2 with invalid data returns error changeset" do
      heroes = heroes_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_heroes(heroes, @invalid_attrs)
      assert heroes == Game.get_heroes!(heroes.id)
    end

    test "delete_heroes/1 deletes the heroes" do
      heroes = heroes_fixture()
      assert {:ok, %Heroes{}} = Game.delete_heroes(heroes)
      assert_raise Ecto.NoResultsError, fn -> Game.get_heroes!(heroes.id) end
    end

    test "change_heroes/1 returns a heroes changeset" do
      heroes = heroes_fixture()
      assert %Ecto.Changeset{} = Game.change_heroes(heroes)
    end
  end
end
