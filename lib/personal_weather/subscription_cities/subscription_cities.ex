defmodule PersonalWeather.SubscriptionCities do
  alias PersonalWeather.SubscriptionCities.SubscriptionCity
  alias PersonalWeather.Repo

  def create(user_id, params) do
    %SubscriptionCity{user_id: user_id}
    |> SubscriptionCity.changeset(params)
    |> Repo.insert
  end
end

# create(conn.assigns.current_user,  params)
