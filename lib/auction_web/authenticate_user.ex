defmodule AuctionWeb.AuthenticateUser do
  import Plug.Conn
  import Phoenix.Controller
  alias AuctionWeb.Router.Helpers

  def init(opts), do: opts

  def call(conn, _params) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: Helpers.session_path(conn, :new))
      |> halt()
    end
  end
end
