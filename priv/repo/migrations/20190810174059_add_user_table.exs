defmodule PersonalWeather.Repo.Migrations.AddUserTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string, null: false, size: 50
      add :last_name, :string, null: false, size: 50
      add :email, :string, null: false, size: 100
      add :password_hash, :string, null: false
      add :is_active, :boolean, null: false, default: false
      timestamps()
    end
  end
end
