defmodule AuctionWeb.UserController do
  use AuctionWeb, :controller

  def show(conn, %{"id" => id}) do
    IO.inspect("in SHOW")
    user = Auction.get_user(id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    IO.inspect("in new")
    user = Auction.new_user()
    render(conn, "new.html", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    case Auction.insert_user(user_params) do
      {:ok, user} -> redirect(conn, to: Routes.user_path(conn, :show, user))
      {:error, user} -> render(conn, "new.html", user: user)
    end
  end
end
