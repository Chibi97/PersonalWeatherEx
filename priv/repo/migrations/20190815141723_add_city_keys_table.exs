defmodule PersonalWeather.Repo.Migrations.AddCityKeysTable do
  use Ecto.Migration

  def change do
    create table(:city_keys) do
      add :accu_weather_key, :integer, null: false
    end
    create unique_index(:city_keys, [:accu_weather_key])
  end
end
