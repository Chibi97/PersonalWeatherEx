defmodule PersonalWeatherWeb.CityController do
  use PersonalWeatherWeb, :controller
  alias PersonalWeather.AccuWeather.Client
  alias PersonalWeather.SubscriptionCities.SubscriptionCities

  plug :authenticate

  def autocomplete(conn, %{"term" => term}) do
    resp = Client.autocomplete_city(term)

    json(conn, resp)
  end

  def subscribe(conn, params)  do
    case SubscriptionCities.create(conn.assigns.current_user.id, params) do
      {:ok, _} -> json(conn, %{"msg" => "success"})
      {:error, changeset} ->
        errors = translate(changeset)
        conn
          |> put_status(400)
          |> json(%{errors: errors})
    end
  end
end
