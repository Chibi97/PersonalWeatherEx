defmodule PersonalWeather.Repo do
  use Ecto.Repo,
    otp_app: :personal_weather,
    adapter: Ecto.Adapters.Postgres
end
