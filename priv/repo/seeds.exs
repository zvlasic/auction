# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Auction.Repo.insert!(%Auction.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Auction.Repo.insert!(%Auction.Schemas.Item{
  title: "WarGames Bluray",
  description: "The best computer movie of all time, now on Bluray!",
  ends_at: DateTime.utc_now()
})

Auction.Repo.insert!(%Auction.Schemas.Item{
  title: "U2 - Achtung Baby on CD",
  description: "The sound of 4 men chopping down The Joshua Tree",
  ends_at: DateTime.utc_now()
})

Auction.Repo.insert!(%Auction.Schemas.Item{
  title: "My first item",
  description: "A tasty item sure to please",
  ends_at: DateTime.utc_now()
})
