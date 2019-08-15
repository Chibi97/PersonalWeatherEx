defmodule PersonalWeather.SubscriptionCities.SubscriptionCity do
  use Ecto.Schema
  import Ecto.Changeset

  alias PersonalWeather.SubscriptionCities.SubscriptionCity
  alias PersonalWeather.Accounts.User
  alias PersonalWeather.SubscriptionCities.City

  schema "subscription_cities" do
    field :end_date, :date
    belongs_to :user, User, foreign_key: :user_id
    belongs_to :city, City
    timestamps()
  end

  def changeset(%SubscriptionCity{} = subs, attrs \\ %{}) do
    subs
     |> cast(attrs, [:city_id, :end_date])
     |> validate_required([:city_id, :end_date])
     |> foreign_key_constraint(:city_id)
     |> unique_constraint(:city,
      name: :subscription_cities_city_id_user_id_index,
      message: "Alerady subscribed to this city")
  end
end
