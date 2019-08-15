defmodule PersonalWeatherWeb.Router do
  use PersonalWeatherWeb, :router
  alias PersonalWeatherWeb.Plugs.Authorization

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Authorization
  end

  scope "/", PersonalWeatherWeb do
    pipe_through :browser

    get "/*anything", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", PersonalWeatherWeb do
    pipe_through :api

    resources "/weather", WeatherController

    scope "/auth" do
      post "/login", AuthController, :login
      post "/register", AuthController, :register
    end

    scope "/cities" do
      get "/autocomplete/:term", LocationController, :autocomplete
    end
  end
end
