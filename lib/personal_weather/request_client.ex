defmodule PersonalWeather.RequestClient do
  def request(keyword, url, opts \\ [])

  def request(:get, url, opts) do
    query_params = Keyword.get(opts, :query_params, %{})
    HTTPoison.get! "#{url}?#{_encode(query_params)}"
  end

  def request(:post, url, opts) do
    query_params = Keyword.get(opts, :query_params, %{})
    body = Keyword.get(opts, :body, %{})
    HTTPoison.post!("#{url}?#{_encode(query_params)}", body)
  end

  def request(:put, url, opts) do
    query_params = Keyword.get(opts, :query_params, %{})
    body = Keyword.get(opts, :body, %{})
    HTTPoison.put!("#{url}?#{_encode(query_params)}", body)
  end

  def request(:delete, url, opts) do
    query_params = Keyword.get(opts, :query_params, %{})
    HTTPoison.delete!("#{url}?#{_encode(query_params)}")
  end

  defp _encode(map), do: URI.encode_query(map)

end
