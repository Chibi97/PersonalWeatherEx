defmodule PersonalWeatherWeb.WeatherController do
  use PersonalWeatherWeb, :controller

  plug :authenticate

  def index(conn, _params) do
    json(conn, %{message: "USPEH"})
  end
end
