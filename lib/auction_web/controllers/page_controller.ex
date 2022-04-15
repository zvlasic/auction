defmodule AuctionWeb.PageController do
  use AuctionWeb, :controller

  @items [
    %{
      id: 1,
      title: "My first item",
      description: "A tasty item sure to please",
      ends_at: ~N[2020-01-01 00:00:00]
    },
    %{
      id: 2,
      title: "WarGames Bluray",
      description: "The best computer movie of all time, now on Bluray!",
      ends_at: ~N[2018-10-15 13:39:35]
    },
    %{
      id: 3,
      title: "U2 - Achtung Baby on CD",
      description: "The sound of 4 men chopping down The Joshua Tree",
      ends_at: ~N[2018-11-05 03:12:29]
    }
  ]

  def index(conn, _params) do
    render(conn, "index.html", items: @items)
  end
end
