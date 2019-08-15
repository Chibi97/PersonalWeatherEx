defmodule PersonalWeather.AccuWeather.Client do
  @api_key "0igywNurkykzF5L8B36ODO0wOMiaVCm1"
  @url_base "http://dataservice.accuweather.com"

  alias PersonalWeather.RequestClient

  def find_city_by_id(city) do
    city # ........
  end

  def autocomplete_city(city) do
    RequestClient.request(:get, "#{@url_base}/locations/v1/cities/autocomplete",
      query_params: %{q: city, apikey: @api_key}
    )
    |> _process_response(%{cities: []}, &_format_cities/1)
  end

  defp _format_cities(body) do
    cities =
      Enum.map(body, fn %{"LocalizedName" => city, "Country" => %{"LocalizedName" => country}} ->
        %{"country" => country, "city" => city}
      end)

    %{cities: cities}
  end

  defp _process_response(%{status_code: code, body: body}, _, format_fn)
       when code in 200..299 and body != "" do
    Jason.decode!(body) |> format_fn.()
  end

  defp _process_response(_, default, _), do: default

end
