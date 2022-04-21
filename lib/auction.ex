defmodule Auction do
  alias Auction.Repo
  alias Auction.Schemas.Item

  def items, do: Repo.all(Item)
  def get_item(id), do: Repo.get(Item, id)
  def new_item, do: Item.changeset(%Item{})
  def insert_item(attrs), do: Repo.insert(Item.changeset(%Item{}, attrs))
  def edit_item(id), do: id |> get_item() |> Item.changeset()
  def update_item(item, updates), do: Repo.update(Item.changeset(item, updates))
end
