defmodule PersonalWeatherWeb.LocationController do
  use PersonalWeatherWeb, :controller
  alias PersonalWeather.AccuWeather.Client

  plug :authenticate

  def autocomplete(conn, %{"term" => term}) do
    resp = Client.autocomplete_city(term)

    json(conn, resp)
  end
end
