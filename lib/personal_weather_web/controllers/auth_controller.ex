defmodule PersonalWeatherWeb.AuthController do
  use PersonalWeatherWeb, :controller

  alias PersonalWeather.Accounts
  alias PersonalWeather.Guardian
  import PersonalWeatherWeb.Controllers.Utils

  def login(conn, %{"email" => email, "password" => password}) do
    email
    |> Accounts.login_by_email_and_password(password)
    |> _result_to_jwt
    |> _complete_request(conn)
  end

  def register(conn, params) do
    Accounts.create(params)
    |> _result_to_jwt
    |> _complete_request(conn)
  end

  defp _result_to_jwt({:ok, user}) do
    {:ok, token, _} = Guardian.encode_and_sign(user, %{}, ttl: {7, :days})
    {:ok, %{token: token}}
  end
  defp _result_to_jwt(error), do: error

  defp _complete_request({:ok, response}, conn), do: json(conn, response)
  defp _complete_request({:error, %Ecto.Changeset{} = changeset}, conn) do
    errors = translate(changeset)
    conn |> put_status(400) |> json(%{errors: errors})
  end
  defp _complete_request(_err, conn), do: conn |> put_status(403) |> json(%{message: "Invalid email/password"})
end
