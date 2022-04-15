defmodule Auction.Schemas.Item do
  use Ecto.Schema

  schema "items" do
    field :title, :string
    field :description, :string
    field :ends_at, :utc_datetime_usec
    timestamps()
  end
end
