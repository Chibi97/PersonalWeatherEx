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
    field :is_active, :boolean, default: false
    timestamps()
  end


  def changeset(%User{} = user, attrs \\ %{}) do
    rePass = ~r/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
    reMail = ~r/(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

    user
    |> cast(attrs, [:first_name, :last_name, :email, :password])
    |> validate_required([:first_name, :last_name, :email, :password])
    |> validate_length(:first_name, min: 2, max: 50)
    |> validate_length(:last_name, min: 2, max: 50)
    |> validate_length(:email, min: 5, max: 100)
    |> validate_length(:password, min: 8, max: 50)
    |> validate_format(:password, rePass)
    |> validate_format(:email, reMail)
    # |> put_password_hash()
  end
end
