defmodule PersonalWeatherWeb.UserController do
  use PersonalWeatherWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
