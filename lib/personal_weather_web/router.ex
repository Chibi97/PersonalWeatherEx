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

    # get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", PersonalWeatherWeb do
    pipe_through :api

<<<<<<< HEAD
      resources "/weather", WeatherController

      scope "/auth" do
        post "/login", AuthController, :login
        post "/register", AuthController, :register
      end
=======
    resources "/weather", WeatherController

    scope "/auth" do
      post "/login", AuthController, :login
      post "/register", AuthController, :register
    end
>>>>>>> ff77c8e88ff539880e58fe777e363ba1a6c7a0bf
  end
end
