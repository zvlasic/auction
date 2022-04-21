defmodule Auction do
  alias Auction.Repo
  alias Auction.Schemas.Item

  def items, do: Repo.all(Item)
  def get_item(id), do: Repo.get(Item, id)
end
