defmodule PersonalWeather.Accounts do
  alias PersonalWeather.Repo
  alias PersonalWeather.Accounts.User
  import Ecto.Query

  def create(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert
  end

  def find_by_email(email) do
    User
    |> where([u], u.email == ^email)
    |> where([u], u.is_active == true)
    |> Repo.one()
  end

  def login_by_email_and_password(email, password) do
    user = find_by_email(email)
    cond do
      user && Bcrypt.verify_pass(password, user.password_hash) ->
        {:ok, user}
      user ->
        {:error, :bad_password}
      true ->
        Bcrypt.no_user_verify()
        {:error, :not_found}
    end
  end

end
