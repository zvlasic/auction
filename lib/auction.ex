defmodule Auction do
  alias Auction.{Password, Repo}
  alias Auction.Schemas.{Item, User}

  # ITEMS

  def items, do: Repo.all(Item)
  def get_item(id), do: Repo.get(Item, id)
  def new_item, do: Item.changeset(%Item{})
  def insert_item(attrs), do: %Item{} |> Item.changeset(attrs) |> Repo.insert()
  def edit_item(id), do: id |> get_item() |> Item.changeset()
  def update_item(item, updates), do: item |> Item.changeset(updates) |> Repo.update()

  # USERS

  def get_user(id), do: Repo.get!(User, id)
  def new_user, do: User.changeset_with_password(%User{})
  def insert_user(params), do: %User{} |> User.changeset_with_password(params) |> Repo.insert()

  def fetch_user_by_username_and_password(username, password) do
    user = Repo.get_by(User, username: username)

    cond do
      user && Password.verify_with_hash(password, user.password_hash) ->
        {:ok, user}

      user ->
        {:error, :unauthorized}

      true ->
        Pbkdf2.no_user_verify()
        {:error, :not_found}
    end
  end
end
