defmodule PersonalWeatherWeb.Plugs.Authorization do
  import Plug.Conn
  alias PersonalWeather.Guardian

  def init(default), do: default

  def call(conn, _) do
    auths = get_req_header(conn, "authorization")
    _identify_user(conn, auths)
  end

  # THIS IS A FUNCTIONAL PLUG!
  def authenticate(conn, _opts) do
    cond do
      conn.assigns.current_user && conn.assigns.current_user.is_active ->
        conn

      conn.assigns.current_user ->
        conn
        |> halt()
        |> send_resp(403, Jason.encode!(%{message: "Please activate your account first!"}))

      true ->
        conn
        |> halt()
        |> send_resp(403, Jason.encode!(%{message: "Not Authorized"}))
    end
  end

  defp _identify_user(conn, auths) when auths == [], do: assign(conn, :current_user, nil)

  defp _identify_user(conn, auths) do
    jwt = List.last(auths)

    case Guardian.decode_and_verify(jwt) do
      {:ok, claims} ->
        case Guardian.resource_from_claims(claims) do
          {:ok, user} ->
            conn
            |> assign(:current_user, user)

          _ ->
            assign(conn, :current_user, nil)
        end

      _ ->
        assign(conn, :current_user, nil)
    end
  end
end
