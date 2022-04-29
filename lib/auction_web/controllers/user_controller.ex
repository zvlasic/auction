defmodule AuctionWeb.UserController do
  use AuctionWeb, :controller

  def show(conn, %{"id" => id}) do
    user = Auction.get_user(id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    user = Auction.new_user()
    render(conn, "new.html", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    case Auction.insert_user(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, user} ->
        render(conn, "new.html", user: user)
    end
  end
end
