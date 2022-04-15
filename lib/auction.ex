defmodule Auction do
  alias Auction.Repo
  alias Auction.Schemas.Item

  def items, do: Repo.all(Item)
end
