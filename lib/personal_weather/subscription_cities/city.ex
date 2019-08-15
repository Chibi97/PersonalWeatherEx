defmodule PersonalWeather.SubscriptionCities.City do
  use Ecto.Schema
  import Ecto.Changeset
  alias PersonalWeather.SubscriptionCities.City

  schema "city_keys" do
    field :accu_weather_key, :integer
  end

  def changeset(%City{} = city, attrs \\ %{}) do
    city
    |> cast(attrs, [:accu_weather_key])
    |> validate_required([:accu_weather_key])
  end
end
