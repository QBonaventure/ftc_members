defmodule FtcMembersWeb.HeroesControllerTest do
  use FtcMembersWeb.ConnCase

  alias FtcMembers.Game

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:heroes) do
    {:ok, heroes} = Game.create_heroes(@create_attrs)
    heroes
  end

  describe "index" do
    test "lists all heroes", %{conn: conn} do
      conn = get conn, heroes_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Heroes"
    end
  end

  describe "new heroes" do
    test "renders form", %{conn: conn} do
      conn = get conn, heroes_path(conn, :new)
      assert html_response(conn, 200) =~ "New Heroes"
    end
  end

  describe "create heroes" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, heroes_path(conn, :create), heroes: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == heroes_path(conn, :show, id)

      conn = get conn, heroes_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Heroes"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, heroes_path(conn, :create), heroes: @invalid_attrs
      assert html_response(conn, 200) =~ "New Heroes"
    end
  end

  describe "edit heroes" do
    setup [:create_heroes]

    test "renders form for editing chosen heroes", %{conn: conn, heroes: heroes} do
      conn = get conn, heroes_path(conn, :edit, heroes)
      assert html_response(conn, 200) =~ "Edit Heroes"
    end
  end

  describe "update heroes" do
    setup [:create_heroes]

    test "redirects when data is valid", %{conn: conn, heroes: heroes} do
      conn = put conn, heroes_path(conn, :update, heroes), heroes: @update_attrs
      assert redirected_to(conn) == heroes_path(conn, :show, heroes)

      conn = get conn, heroes_path(conn, :show, heroes)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, heroes: heroes} do
      conn = put conn, heroes_path(conn, :update, heroes), heroes: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Heroes"
    end
  end

  describe "delete heroes" do
    setup [:create_heroes]

    test "deletes chosen heroes", %{conn: conn, heroes: heroes} do
      conn = delete conn, heroes_path(conn, :delete, heroes)
      assert redirected_to(conn) == heroes_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, heroes_path(conn, :show, heroes)
      end
    end
  end

  defp create_heroes(_) do
    heroes = fixture(:heroes)
    {:ok, heroes: heroes}
  end
end
