defmodule Auction do
  alias Auction.Repo
  alias Auction.Schemas.{Item, User}

  # ITEMS

  def items, do: Repo.all(Item)
  def get_item(id), do: Repo.get(Item, id)
  def new_item, do: Item.changeset(%Item{})
  def insert_item(attrs), do: Repo.insert(Item.changeset(%Item{}, attrs))
  def edit_item(id), do: id |> get_item() |> Item.changeset()
  def update_item(item, updates), do: Repo.update(Item.changeset(item, updates))

  # USERS

  def get_user(id), do: Repo.get!(User, id)
  def new_user, do: User.changeset_with_password(%User{})
  def insert_user(params), do: %User{} |> User.changeset_with_password(params) |> Repo.insert()
end
