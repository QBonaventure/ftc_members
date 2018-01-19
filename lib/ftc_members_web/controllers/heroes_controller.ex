defmodule FtcMembersWeb.HeroesController do
  use FtcMembersWeb, :controller

  alias FtcMembers.Game
  alias FtcMembers.Game.Heroes

  def index(conn, _params) do
    heroes = Game.list_heroes()
    render(conn, "index.html", heroes: heroes)
  end

  def new(conn, _params) do
    changeset = Game.change_heroes(%Heroes{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"heroes" => heroes_params}) do
    case Game.create_heroes(heroes_params) do
      {:ok, heroes} ->
        conn
        |> put_flash(:info, "Heroes created successfully.")
        |> redirect(to: heroes_path(conn, :show, heroes))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    heroes = Game.get_heroes!(id)
    render(conn, "show.html", heroes: heroes)
  end

  def edit(conn, %{"id" => id}) do
    heroes = Game.get_heroes!(id)
    changeset = Game.change_heroes(heroes)
    render(conn, "edit.html", heroes: heroes, changeset: changeset)
  end

  def update(conn, %{"id" => id, "heroes" => heroes_params}) do
    heroes = Game.get_heroes!(id)

    case Game.update_heroes(heroes, heroes_params) do
      {:ok, heroes} ->
        conn
        |> put_flash(:info, "Heroes updated successfully.")
        |> redirect(to: heroes_path(conn, :show, heroes))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", heroes: heroes, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    heroes = Game.get_heroes!(id)
    {:ok, _heroes} = Game.delete_heroes(heroes)

    conn
    |> put_flash(:info, "Heroes deleted successfully.")
    |> redirect(to: heroes_path(conn, :index))
  end
end
