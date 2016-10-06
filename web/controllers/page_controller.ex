defmodule UnsubscibeWatcher.PageController do
  use UnsubscibeWatcher.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
