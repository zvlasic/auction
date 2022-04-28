defmodule AuctionWeb.Router do
  use AuctionWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {AuctionWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug AuctionWeb.SetCurrentUser
  end

  pipeline :authenticated_browser do
    plug :browser
    plug AuctionWeb.AuthenticateUser
  end

  scope "/", AuctionWeb do
    pipe_through :authenticated_browser

    get "/", PageController, :index

    resources "/items", ItemController, only: [:index, :show, :new, :create, :edit, :update]

    resources "/users", UserController, only: [:show, :new, :create]

    delete "/logout", SessionController, :delete
  end

  scope "/", AuctionWeb do
    pipe_through :browser

    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end
end
