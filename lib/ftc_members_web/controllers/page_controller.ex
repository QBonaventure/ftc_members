defmodule FtcMembersWeb.PageController do
  use FtcMembersWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
