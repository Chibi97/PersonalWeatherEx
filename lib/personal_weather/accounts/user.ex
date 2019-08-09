defmodule PersonalWeather.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PersonalWeather.Accounts.User

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virutal: true
    field :deleted_at, :date
    timestamps()
  end

  def changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password])
    |> validate_required([:first_name, :last_name, :email, :password])
    |> validate_length(:first_name, min: 2, max: 50)
  end
end
