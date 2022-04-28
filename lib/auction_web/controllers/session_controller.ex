defmodule AuctionWeb.SessionController do
  use AuctionWeb, :controller

  def new(conn, _params), do: render(conn, "new.html")

  def create(conn, %{"user" => %{"username" => username, "password" => password}}) do
    case Auction.fetch_user_by_username_and_password(username, password) do
      {:ok, user} ->
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Successfully logged in")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, _} ->
        conn
        |> put_flash(:error, "That username and password combination cannot be found")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> clear_session()
    |> configure_session(drop: true)
    |> redirect(to: Routes.item_path(conn, :index))
  end
end
