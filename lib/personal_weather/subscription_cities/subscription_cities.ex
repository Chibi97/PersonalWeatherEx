defmodule PersonalWeather.SubscriptionCities.SubscriptionCities do
  alias PersonalWeather.SubscriptionCities.SubscriptionCity
  alias PersonalWeather.Repo

  def create(user_id, params) do
    %SubscriptionCity{user_id: user_id}
    |> SubscriptionCity.changeset(params)
    |> Repo.insert
  end
end

