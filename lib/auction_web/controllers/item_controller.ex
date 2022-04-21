defmodule AuctionWeb.ItemController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    items = Auction.items()
    render(conn, "index.html", items: items)
  end

  def show(conn, %{"id" => id}) do
    item = Auction.get_item(id)
    render(conn, "show.html", item: item)
  end
end
