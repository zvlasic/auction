defmodule AuctionWeb.SetCurrentUser do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Auction.get_user(user_id)
    assign(conn, :current_user, user)
  end
end
