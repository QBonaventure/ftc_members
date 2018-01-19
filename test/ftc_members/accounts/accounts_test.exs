defmodule FtcMembers.AccountsTest do
  use FtcMembers.DataCase

  alias FtcMembers.Accounts

  describe "users" do
    alias FtcMembers.Accounts.User

    @valid_attrs %{bnet_id: "some bnet_id", name: "some name", username: "some username"}
    @update_attrs %{bnet_id: "some updated bnet_id", name: "some updated name", username: "some updated username"}
    @invalid_attrs %{bnet_id: nil, name: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.bnet_id == "some bnet_id"
      assert user.name == "some name"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.bnet_id == "some updated bnet_id"
      assert user.name == "some updated name"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "members" do
    alias FtcMembers.Accounts.Member

    @valid_attrs %{bnet_id: "some bnet_id", username: "some username"}
    @update_attrs %{bnet_id: "some updated bnet_id", username: "some updated username"}
    @invalid_attrs %{bnet_id: nil, username: nil}

    def member_fixture(attrs \\ %{}) do
      {:ok, member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_member()

      member
    end

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Accounts.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Accounts.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Accounts.create_member(@valid_attrs)
      assert member.bnet_id == "some bnet_id"
      assert member.username == "some username"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, member} = Accounts.update_member(member, @update_attrs)
      assert %Member{} = member
      assert member.bnet_id == "some updated bnet_id"
      assert member.username == "some updated username"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_member(member, @invalid_attrs)
      assert member == Accounts.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Accounts.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Accounts.change_member(member)
    end
  end
end
