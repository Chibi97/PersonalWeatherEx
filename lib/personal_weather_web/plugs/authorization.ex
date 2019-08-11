defmodule PersonalWeatherWeb.Plugs.Authorization do
  import Plug.Conn
  alias PersonalWeatherWeb.Guardian

  def init(default), do: default

  def call(conn, opts) do
    IO.inspect opts
     _identify_user(conn, opts)
  end

  defp _identify_user(conn, %{"secret" => jwt}) do
    case Guardian.decode_and_verify(jwt) do
      {:ok, claims} ->
        case Guardian.resource_from_claims(claims) do
          {:ok, user} ->
            conn
              |> assign(:current_user, user)
          _ -> assign(conn, :current_user, nil)
        end
      _ -> conn #maybe
    end
  end
end

