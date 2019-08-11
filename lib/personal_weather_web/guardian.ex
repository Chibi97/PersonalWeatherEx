defmodule PersonalWeatherWeb.Guardian do
  use Guardian, otp_app: :personal_weather_web
  alias PersonalWeather.Repo
  alias PersonalWeather.Accounts.User

  def subject_for_token(%User{id: _} = user, _claims) do
    crypted = Comeonin.Bcrypt.hashpwsalt("#{user.email}:#{user.id}")
    sub = Jason.encode!(%{email: user.email, id_hash: crypted})
    {:ok, sub}
  end

  def subject_for_token(_, _), do: {:error, :unhandled_resource_type}

  def resource_from_claims(_resource, _claims), do: {:error, :unhandled_resource_type}

  def resource_from_claims(claims) do
    crypted = Jason.decode!(claims["sub"])
    user = Repo.get_by(User, email: crypted["email"])
    to_check = "#{user.email}:#{user.id}"
    if Comeonin.Bcrypt.checkpw(to_check, crypted["id_hash"]) do
      {:ok, user}
    else
      {:error, :invalid_token}
    end
  end

end

