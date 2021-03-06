defmodule FtcMembersWeb.Router do
  use FtcMembersWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FtcMembersWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/members", MemberController
    resources "/heroes", HeroesController
  end

  # Other scopes may use custom stacks.
  # scope "/api", FtcMembersWeb do
  #   pipe_through :api
  # end
end
