defmodule PersonalWeather.Repo.Migrations.AddSubscriptionCitiesTable do
  use Ecto.Migration

  def change do
    create table(:subscription_cities) do
      add :city_id, references(:city_keys, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :delete_all)
      add :end_date, :date, null: false, default: fragment("now()")
      timestamps()
    end

    create unique_index(:subscription_cities, [:city_id])
    create unique_index(:subscription_cities, [:user_id])
  end
end
