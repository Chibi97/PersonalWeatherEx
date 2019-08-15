# PersonalWeather

### Phoenix and Elixir API that for tracking forecasts of your pinned cities.

## Installation guide

You need to have the following software installed on your system:
 
 - PostgreSQL (11.3)
 - erlang (OTP 21)
 - Elixir (1.8.2)
 - Node (12.2.0)
   - yarn (1.16.0)

### Postgres

Firstly, lets make sure postgres is installed:

```bash
psql --version
# psql (PostgreSQL) 11.3
```

Then, make sure you have postgres configured to login with user and
password. You might need to change your postgres setting from `peer` to
`md5` to allow user/password login.

```bash
psql -U postgres --password
# then type out password
```

You should login, with the password `postgres`, as that's what Phoenix
is configured to use.

### Erlang / Elixir
Firstly, let's setup a version manager for elixir/erlang `asdf`.
`https://github.com/asdf-vm/asdf`

Now, make sure we properly installed it and added it to `PATH`.
```bash
asdf --version
#v0.7.2
```

Let's add the necesarry plugins:
```bash
asdf plugin-add erlang
asdf plugin-add elixir
```

Then, install elixir and erlang:
```bash
asdf install erlang 21.1
asadf install elixir 1.8.2
```

The `elixir` command should display the version:
```bash
elixir --version
# Erlang/OTP 21 [erts-10.3] [source] [64-bit] [smp:8:8] [ds:8:8:10] 
# [async-threads:1] [hipe]
# Elixir 1.8.2 (compiled with Erlang/OTP 20)
```

Finally, go to the project, install the **deps** and apply migrations
to the **database**.
```
cd ~/PATH_TO_PROJECT
mix deps.get # install dependecies
mix ecto.create # create the database
mix ecto.migrate # apply the migrations
mix run priv/rep/seeds.exs
```

## Node / Vue
Let's finally setup front end for this application.
```bash
cd assets # from project dir
yarn
yarn build # for building the first production served from Phoenix
```

We can start developing the application now. Just run:
`iex -S mix phx.server`. Ignore the bunch of text showing up, as this will start the webpack development server serving Vue.JS too!