defmodule PersonalWeatherWeb.CityController do
  use PersonalWeatherWeb, :controller
  alias PersonalWeather.AccuWeather.Client

  plug :authenticate

  def autocomplete(conn, %{"term" => term}) do
    resp = Client.autocomplete_city(term)

    json(conn, resp)
  end

  def subscribe(conn, %{"city"=> _, "until" => _} = _params)  do

    # /api/cities { "city": "Belgrade", "until" "2020/y" }
    resp = ""
    json(conn, resp)
  end
end
