defmodule AuctionWeb.ItemController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    items = Auction.items()
    render(conn, "index.html", items: items)
  end
end
