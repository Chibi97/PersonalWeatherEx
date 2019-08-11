defmodule PersonalWeatherWeb.AuthController do
  use PersonalWeatherWeb, :controller

  alias PersonalWeather.Accounts
  alias PersonalWeather.Guardian

  def login(conn, %{"email" => email, "password" => password}) do
    email
    |> Accounts.login_by_email_and_password(password)
    |> _result_to_jwt
    |> _complete_request(conn)
  end

  def register(conn, _params) do
    render(conn, [])
  end

  defp _result_to_jwt({:ok, user}) do
    case Guardian.encode_and_sign(user, %{}, ttl: {7, :days}) do
      {:ok, token, _} -> {:ok, %{token: token}}
      _ -> {:error, :bad_token}
    end
  end
  defp _result_to_jwt(error), do: error

  defp _complete_request({:ok, response}, conn), do: json(conn, response)
  defp _complete_request(_err, conn), do: conn |> put_status(403) |> json(%{message: "Invalid email/password"})
end
