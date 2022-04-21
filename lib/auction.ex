defmodule Auction do
  alias Auction.Repo
  alias Auction.Schemas.Item

  def items, do: Repo.all(Item)
  def get_item(id), do: Repo.get(Item, id)
  def new_item, do: Item.changeset(%Item{})
  def insert_item(attrs), do: Repo.insert(Item.changeset(%Item{}, attrs))
end
