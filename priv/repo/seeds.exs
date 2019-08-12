# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PersonalWeather.Repo.insert!(%PersonalWeather.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias PersonalWeather.Accounts.User
alias PersonalWeather.Repo

Repo.insert!(%User{
  first_name: "Oki",
  last_name: "Okica",
  email: "oki@email.com",
  password_hash: Bcrypt.hash_pwd_salt("secret"),
  is_active: true
})
