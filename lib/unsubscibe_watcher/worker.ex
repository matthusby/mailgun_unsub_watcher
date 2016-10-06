defmodule UnsubscibeWatcher.Worker do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    Process.send_after(self(), :run, 1000)
    {:ok, []}
  end

  def handle_info(:run, state) do
    IO.puts "Checking now."
    email = System.get_env("UNSUB_EMAIL")
    domain = System.get_env("UNSUB_DOMAIN")
    key = System.get_env("UNSUB_MAILGUN_API_KEY")

    url = "https://api:#{key}@api.mailgun.net/v3/#{domain}/unsubscribes/#{email}"
    case HTTPoison.get url do
      {:ok, %HTTPoison.Response{status_code: 200}} ->
        HTTPoison.delete url
      _ ->
        :ok
    end

    Process.send_after(self(), :run, 60 * 60 * 1000) # run once an hour
    {:noreply, state}
  end
end
