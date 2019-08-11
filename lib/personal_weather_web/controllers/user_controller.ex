defmodule PersonalWeatherWeb.WeatherController do
  use PersonalWeatherWeb, :controller
  # plug :authenticate

  # def authenticate(conn, _opts) do
  #   user? = Map.get(conn.assigns, :current_user, nil)
  #   if user? do
  #     conn
  #   else
  #     conn
  #      |> put_status(403)
  #      |> halt()
  #   end
  # end

  def index(conn, _params) do
    render(conn, {})
  end
end
